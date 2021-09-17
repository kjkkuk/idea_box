class ChangeFeedbackRatingType < ActiveRecord::Migration[6.1]
  def change
    change_column :feedbacks, :rating, :integer
  end
end
