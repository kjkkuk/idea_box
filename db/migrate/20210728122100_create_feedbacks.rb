class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :dislike, null: false
      t.integer :like, null: false
      t.float :rating, null: false
      t.references :users, index: true, foreign_key: true
      t.references :ideas, index: true, foreign_key: true


      t.timestamps
    end
  end
end
