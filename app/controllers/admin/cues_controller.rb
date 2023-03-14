module Admin
  class CuesController < AdminController
    INCLUDES = %i[medium playlist speakers user].freeze

    include Pagy::Backend

    before_action :sanitize_cue_params, only: %i[create update]

    load_and_authorize_resource
    skip_load_resource only: :index

    # GET /admin/cues or /admin/cues.json
    def index
      if params[:query].present?
        search
      elsif params[:tag].present?
        tag_filter
      else
        @pagy, @cues = pagy(Cue.accessible_by(current_ability).includes(INCLUDES).order(:id))
      end
    end

    # GET /admin/cues/1 or /admin/cues/1.json
    def show; end

    # GET /admin/cues/new
    def new; end

    # GET /admin/cues/1/edit
    def edit; end

    # POST /admin/cues or /admin/cues.json
    def create
      @cue.user = current_user

      respond_to do |format|
        if @cue.save
          format.html { redirect_to admin_cue_url(@cue), notice: 'Cue was successfully created.' }
          format.json { render :show, status: :created, location: @cue }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @cue.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/cues/1 or /admin/cues/1.json
    def update
      respond_to do |format|
        if @cue.update(cue_params)
          format.html { redirect_to admin_cue_url(@cue), notice: 'Cue was successfully updated.' }
          format.json { render :show, status: :ok, location: @cue }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @cue.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/cues/1 or /admin/cues/1.json
    def destroy
      @cue.destroy

      respond_to do |format|
        format.html { redirect_to admin_cues_url, notice: 'Cue was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def search
      cues = Cue.accessible_by(current_ability).includes(INCLUDES).pagy_search(params[:query])
      @pagy, @cues = pagy_meilisearch(cues)
    end

    def tag_filter
      cues = Cue.accessible_by(current_ability).tagged_with(params[:tag]).includes(INCLUDES).order(:id)
      @pagy, @cues = pagy(cues)
    end

    def sanitize_cue_params
      params[:cue][:start_time] = params[:cue][:start_time].to_i.seconds
      params[:cue][:end_time] = params[:cue][:end_time].to_i.seconds
    end

    # Only allow a list of trusted parameters through.
    def cue_params
      params.require(:cue).permit(:content, :start_time, :end_time, :hidden, :medium_id)
    end
  end
end
