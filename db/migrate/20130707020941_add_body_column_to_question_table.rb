class AddBodyColumnToQuestionTable < ActiveRecord::Migration
  def change
    add_column :questions, :body, :text
  end
end
