class AddFieldToDoctors < ActiveRecord::Migration[7.2]
  def change
    add_column :doctors, :active, :boolean
  end
end
