class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :idea_name, null: false, limit: 225
      t.string :idea_description, null: false
      t.string :need, null: false
      t.string :geo, null: false
      t.string :problem, null: false, limit: 225
      t.string :industry, null: false
      t.boolean :visible, null: false
      t.references :teams, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end