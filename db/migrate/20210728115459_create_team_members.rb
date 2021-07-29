class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.integer :team_role, null: false
      t.references :teams, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps
    end
  end
end
