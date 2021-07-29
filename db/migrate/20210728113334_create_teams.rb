class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :team_name, null: false, limit: 225

      t.timestamps
    end
  end
end
