class AddFieldsInUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :lastname, :string
    add_column :users, :Address1, :string
    add_column :users, :Address2, :string
    add_column :users, :city, :string
    add_column :users, :contact, :string
    add_column :users, :DOB, :string
    add_column :users, :gender, :string
  end
end
