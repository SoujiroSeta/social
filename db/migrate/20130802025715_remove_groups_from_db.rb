class RemoveGroupsFromDb < ActiveRecord::Migration
  def up
  	drop_table :groups
  end

  def down
 		create_table :groups do |t|
      t.string :title
      t.string :slug  
      t.timestamps
    end
    add_index :groups, :slug, unique: true
  end
end
