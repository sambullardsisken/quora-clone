class CreateQuestionTaggings < ActiveRecord::Migration
  def change
    create_table :question_taggings do |t|
      t.integer :question_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
