class BankAccountSerializer < ActiveModel::Serializer
  attributes :id, :account_holder, :bank

  def account_holder
    "#{object.user.name} #{object.user.last_name}"
  end

  def bank
    object.bank.name
  end
end
