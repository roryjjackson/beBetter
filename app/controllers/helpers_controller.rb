class HelpersController < ApplicationController
  before_action :set_helper, only: %i[ show edit update destroy ]

  # GET /helpers or /helpers.json
  def index
    @helpers = Helper.all
    @helpers = policy_scope(Helper)
  end

  # GET /helpers/1 or /helpers/1.json
  def show
    authorize @helper
  end

  # GET /helpers/new
  def new
    @helper = Helper.new
    authorize @helper
  end

  # GET /helpers/1/edit
  def edit
    authorize @helper
  end

  # POST /helpers or /helpers.json
  def create
    @helper = Helper.new(helper_params)
    @helper.user_id = current_user.id
    authorize @helper
    respond_to do |format|
      if @helper.save
        format.html { redirect_to helper_url(@helper), notice: "Helper was successfully created." }
        format.json { render :show, status: :created, location: @helper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helpers/1 or /helpers/1.json
  def update
    authorize @helper
    respond_to do |format|
      if @helper.update(helper_params)
        format.html { redirect_to helper_url(@helper), notice: "Helper was successfully updated." }
        format.json { render :show, status: :ok, location: @helper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @helper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helpers/1 or /helpers/1.json
  def destroy
    authorize @helper
    @helper.destroy

    respond_to do |format|
      format.html { redirect_to helpers_url, notice: "Helper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_helper
      @helper = Helper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def helper_params
      params.require(:helper).permit(:occupation, :summary)
    end
end
