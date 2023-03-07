module Admin
  class SpeakersController < AdminController
    include Pagy::Backend

    load_and_authorize_resource
    skip_load_resource only: :index

    # GET /admin/speakers or /admin/speakers.json
    def index
      @pagy, @speakers = pagy(Speaker.accessible_by(current_ability).order(:id))
    end

    # GET /admin/speakers/1 or /admin/speakers/1.json
    def show; end

    # GET /admin/speakers/new
    def new; end

    # GET /admin/speakers/1/edit
    def edit; end

    # POST /admin/speakers or /admin/speakers.json
    def create
      @speaker.user = current_user

      respond_to do |format|
        if @speaker.save
          format.html { redirect_to admin_speaker_url(@speaker), notice: 'Speaker was successfully created.' }
          format.json { render :show, status: :created, location: @speaker }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @speaker.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/speakers/1 or /admin/speakers/1.json
    def update
      respond_to do |format|
        if @speaker.update(speaker_params)
          format.html { redirect_to admin_speaker_url(@speaker), notice: 'Speaker was successfully updated.' }
          format.json { render :show, status: :ok, location: @speaker }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @speaker.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/speakers/1 or /admin/speakers/1.json
    def destroy
      @speaker.destroy

      respond_to do |format|
        format.html { redirect_to admin_speakers_url, notice: 'Speaker was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Only allow a list of trusted parameters through.
    def speaker_params
      params.require(:speaker).permit(:name, :description, :tag_list, :hidden)
    end
  end
end
