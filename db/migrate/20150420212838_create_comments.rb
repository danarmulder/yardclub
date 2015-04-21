class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :author
      t.string :parent_id

      t.timestamps
    end
  end
end
