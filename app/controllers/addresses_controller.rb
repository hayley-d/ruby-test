class AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

  def index
    @addresses = Address.all
  end

  def show
    address = Address.includes(:user).all.find params[:id]
    render json: address
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy!

    respond_to do |format|
      format.html { redirect_to addresses_path, status: :see_other, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :user_id)
    end
end
