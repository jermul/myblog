class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.references :post

      t.timestamps
    end
    add_index :comments, [:user_id, :post_id, :created_at]
  end
end
