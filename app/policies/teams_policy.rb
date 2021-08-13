# frozen_string_literal: true

class TeamsPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    true if user.present? && user == teams.user
  end

  def destroy?
    true if user.present? && user == teams.user
  end

  private

  def teams
    record
  end
end
