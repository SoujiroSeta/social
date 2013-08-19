class AddTotalViewToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :total_view, :integer
  end
end
