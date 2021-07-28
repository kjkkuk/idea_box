class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment, null: false
      t.references :commentable, polymorphic: true
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
