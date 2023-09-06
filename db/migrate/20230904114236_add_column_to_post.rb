class AddColumnToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :integer, add_foreign_key: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #add_foreign_key :posts, :user, add_foreign_key: true
  end
end
