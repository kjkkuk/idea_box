class RemoveDislikeLikeFromFeedback < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedbacks, :dislike
    remove_column :feedbacks, :like
  end
end
