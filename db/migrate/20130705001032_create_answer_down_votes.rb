class CreateAnswerDownVotes < ActiveRecord::Migration
  def change
    create_table :answer_down_votes do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
