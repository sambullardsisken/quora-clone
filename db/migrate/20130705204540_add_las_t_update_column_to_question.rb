class AddLasTUpdateColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :last_update, :string
  end
end
