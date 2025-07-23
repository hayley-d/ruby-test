class AddFieldToPets < ActiveRecord::Migration[7.2]
  def change
    add_column :pets, :breed, :string
  end
end
