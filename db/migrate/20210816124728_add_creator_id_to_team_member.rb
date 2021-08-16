class AddCreatorIdToTeamMember < ActiveRecord::Migration[6.1]
  def change
    add_column :team_members, :is_creator, :boolean, null: false
  end
end
