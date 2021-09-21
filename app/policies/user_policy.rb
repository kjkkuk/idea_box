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
    all_members = []
    user.team_members.where(is_creator: true).each do |tm|
      tm.team.team_members.where(is_creator: false).each do |not_creator|
        all_members << not_creator
      end
    end
    all_members.pluck(:users_id).include?(record.id)
  end
end
