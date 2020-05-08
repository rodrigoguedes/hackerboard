class AddHitsCountToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :hits_count, :integer, null: false, default: 0
  end
end
