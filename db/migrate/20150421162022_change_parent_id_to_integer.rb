class ChangeParentIdToInteger < ActiveRecord::Migration
  def change
    change_column :comments, :parent_id, 'integer USING CAST(parent_id AS integer)'
  end
end
