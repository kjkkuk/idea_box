class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :dislike
      t.integer :like
      t.float :rating

      t.timestamps
    end
  end
end
