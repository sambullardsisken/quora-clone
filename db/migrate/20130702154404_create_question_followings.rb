class CreateQuestionFollowings < ActiveRecord::Migration
  def change
    create_table :question_followings do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
