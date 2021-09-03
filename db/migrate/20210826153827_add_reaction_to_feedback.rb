class AddReactionToFeedback < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :reaction, :boolean
    add_index :feedbacks, :reaction
  end
end
