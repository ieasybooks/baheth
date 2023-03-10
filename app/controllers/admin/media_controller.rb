module Admin
  class MediaController < AdminController
    include Pagy::Backend

    before_action :sanitize_medium_params, only: %i[create update]

    load_and_authorize_resource
    skip_load_resource only: :index

    # GET /admin/media or /admin/media.json
    def index
      @pagy, @media = pagy(Medium.accessible_by(current_ability).includes([
                                                                            { transcript_attachment: :blob },
                                                                            :taggings,
                                                                            :playlist,
                                                                            :speakers,
                                                                            :user
                                                                          ]).order(:id))
    end

    # GET /admin/media/1 or /admin/media/1.json
    def show; end

    # GET /admin/media/new
    def new; end

    # GET /admin/media/1/edit
    def edit; end

    # POST /admin/media or /admin/media.json
    def create
      @medium.user = current_user

      respond_to do |format|
        if @medium.save
          format.html { redirect_to admin_medium_url(@medium), notice: 'Medium was successfully created.' }
          format.json { render :show, status: :created, location: @medium }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @medium.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/media/1 or /admin/media/1.json
    def update
      respond_to do |format|
        if @medium.update(medium_params)
          format.html { redirect_to admin_medium_url(@medium), notice: 'Medium was successfully updated.' }
          format.json { render :show, status: :ok, location: @medium }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @medium.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/media/1 or /admin/media/1.json
    def destroy
      @medium.destroy

      respond_to do |format|
        format.html { redirect_to admin_media_url, notice: 'Medium was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def sanitize_medium_params
      params[:medium][:duration] = params[:medium][:duration].to_i.seconds
    end

    # Only allow a list of trusted parameters through.
    def medium_params
      params.require(:medium).permit(
        :title, :description, :duration, :link, :source,
        :producer, :provider, :transcript, :tag_list, :hidden,
        :playlist_id
      )
    end
  end
end
