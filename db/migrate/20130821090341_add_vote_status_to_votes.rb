class AddVoteStatusToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :vote_status, :string
  end
end
