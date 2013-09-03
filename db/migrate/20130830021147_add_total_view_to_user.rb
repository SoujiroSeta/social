class AddTotalViewToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_view, :integer
  end
end
