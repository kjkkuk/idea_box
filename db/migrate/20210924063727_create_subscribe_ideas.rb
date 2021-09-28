class CreateSubscribeIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribe_ideas do |t|
      t.references :ideas, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
