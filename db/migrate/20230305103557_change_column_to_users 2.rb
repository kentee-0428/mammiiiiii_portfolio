class ChangeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :gender, :string
  end
end
