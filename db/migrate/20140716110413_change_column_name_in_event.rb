class ChangeColumnNameInEvent < ActiveRecord::Migration
  def change
    rename_column :events,:eventDesctiption, :eventDescription
  end
end