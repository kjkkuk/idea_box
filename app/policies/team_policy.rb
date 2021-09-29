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
    user.team_members.where(is_creator: true).any? do |creator|
      creator.teams_id == record.id
    end
  end

  def destroy?
    user.team_members.where(is_creator: true).any? do |creator|
      creator.teams_id == record.id
    end
  end
end
