class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|
      t.string :idea_name
      t.string :idea_description
      t.string :need
      t.string :geo
      t.string :problem
      t.string :industry
      t.boolean :visible

      t.timestamps
    end
  end
end
