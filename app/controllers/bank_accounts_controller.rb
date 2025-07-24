class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show edit update destroy ]

  def index
    @bank_accounts = BankAccount.all
  end

  def show
    account = BankAccount.includes(:bank, :user).all.find params[:id]
    render json: account
  end

  def new
    @bank_account = BankAccount.new
  end

  def edit
  end

  def create
    bank_account = CreateAccountService.call(
      user_id: params[:user_id],
      bank_id: params[:bank_id]
    )
    render json: bank_account, status: :created
  rescue ActiveRecord::RecordNotFound => e
    render json: e.record.errors, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: e.record.errors, status: :unprocessible_entity
  end

  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to @bank_account, notice: "Bank account was successfully updated." }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank_account.destroy!

    respond_to do |format|
      format.html { redirect_to bank_accounts_path, status: :see_other, notice: "Bank account was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    def bank_account_params
      params.require(:bank_account).permit(:user_id, :bank_id)
    end
end
