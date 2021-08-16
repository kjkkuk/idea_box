# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
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
