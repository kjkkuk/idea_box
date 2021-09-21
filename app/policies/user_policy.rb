# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    user&.id == record.id
  end

  def impersonate?
    all_members = user.team_members.where(is_creator: true).reduce([]) do |memo, tm|
      tm.team.team_members.where(is_creator: false).each do |not_creator|
        memo << not_creator.users_id
      end
      memo
    end
    all_members.include?(record.id)
  end
end
