# frozen_string_literal: true

class TeamMembersController < ApplicationController
  def index
    @team_members = TeamMember.all
  end

  def new
    @team_member = TeamMember.new
  end

  def edit; end

  def update
    @team
  end

  def create; end

  def destroy; end
end
