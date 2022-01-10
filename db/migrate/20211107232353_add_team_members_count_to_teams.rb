class AddTeamMembersCountToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :team_members_count, :integer
  end
end
