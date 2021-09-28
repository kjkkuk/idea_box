# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.team_members.where(is_creator: true).each do |creator|
      @output = (creator.teams_id == record.id)
    end
    @output
  end

  def destroy?
    user.team_members.where(is_creator: true).each do |creator|
      @output = (creator.teams_id == record.id)
    end
    @output
  end
end
