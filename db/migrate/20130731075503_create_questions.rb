class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :message
      t.references :user
      t.string :slug  
      t.timestamps
    end
    add_index :questions, :slug, unique: true
  end
end

