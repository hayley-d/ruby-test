class CreateBankAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :bank_accounts do |t|
      t.string :account_number
      t.references :user, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
