class AddFieldToBankAccount < ActiveRecord::Migration[7.2]
  def change
    add_column :bank_accounts, :card_name, :string
    add_column :bank_accounts, :expiry_date, :datetime
  end
end
