class TorenameColumnComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :comments, :message
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
