module Admin
  class PlaylistsController < AdminController
    include Pagy::Backend

    load_and_authorize_resource
    skip_load_resource only: :index

    # GET /admin/playlists or /admin/playlists.json
    def index
      @pagy, @playlists = pagy(Playlist.accessible_by(current_ability).order(:id))
    end

    # GET /admin/playlists/1 or /admin/playlists/1.json
    def show; end

    # GET /admin/playlists/new
    def new; end

    # GET /admin/playlists/1/edit
    def edit; end

    # POST /admin/playlists or /admin/playlists.json
    def create
      @playlist.user = current_user

      respond_to do |format|
        if @playlist.save
          format.html { redirect_to admin_playlist_url(@playlist), notice: 'Playlist was successfully created.' }
          format.json { render :show, status: :created, location: @playlist }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @playlist.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/playlists/1 or /admin/playlists/1.json
    def update
      respond_to do |format|
        if @playlist.update(playlist_params)
          format.html { redirect_to admin_playlist_url(@playlist), notice: 'Playlist was successfully updated.' }
          format.json { render :show, status: :ok, location: @playlist }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @playlist.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/playlists/1 or /admin/playlists/1.json
    def destroy
      @playlist.destroy

      respond_to do |format|
        format.html { redirect_to admin_playlists_url, notice: 'Playlist was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:title, :description, :link, :tag_list, :hidden, speaker_ids: [])
    end
  end
end
