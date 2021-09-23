class ChangeDatatypeNicknameOfCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column :customers, :nickname, :string
  end
end
