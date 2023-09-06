class RemoveForeignKeyToComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, column: :post_id
  end
end
