class CreateReputations < ActiveRecord::Migration
  def change
    create_table :reputations do |t|
      t.string :message
      t.integer :user_id
      t.integer :from_id
      t.integer :point

      t.timestamps
    end
  end
end
