class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]

  def index
    @pets = Pet.all
  end

  def show
    pet = Pet.includes(:user).all.find params[:id]
    render json: pet
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    pet = CreatePetsService.call(user_id: params[:user_id])
    render json: pet, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: e.record.errors, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: e.record.errors, status: :unprocessible_entity
  end

  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.destroy!

    respond_to do |format|
      format.html { redirect_to pets_path, status: :see_other, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :user_id)
    end
end
