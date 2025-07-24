class CreateAccountService
  def self.call(user_id:, bank_id:)
    user = User.find_by(id: user_id)
    raise ActiveRecord::RecordNotFound if user.blank?

    bank = Bank.find_by(id: bank_id)
    raise ActiveRecord::RecordNotFound if bank.blank?

    account_number = SecureRandom.hex(10)

    BankAccount.create!(user: user, bank: bank, account_number: account_number)
  end
end
