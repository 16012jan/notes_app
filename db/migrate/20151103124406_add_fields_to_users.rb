class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :name, :string
    add_column :users, :full_name, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone, :string
  end
end
