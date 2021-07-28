class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.integer :team_role

      t.timestamps
    end
  end
end
