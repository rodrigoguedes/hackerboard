class AddRepliedAtToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :replied_at, :datetime, null: true, default: nil
  end
end
