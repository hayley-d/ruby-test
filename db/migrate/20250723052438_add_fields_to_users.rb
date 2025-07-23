class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :mobile, :string
    add_column :users, :age, :integer
  end
end
