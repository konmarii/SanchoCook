class AddNicknameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :nickname, :integer
  end
end
