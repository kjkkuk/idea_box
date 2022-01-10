# frozen_string_literal: true

class PublicController < ApplicationController
  def index; end

  def search
    # @ideas = Idea.ransack(name_cont: params[:q]).result(distinct: true)
    # @teams = Team.ransack(name_cont: params[:q]).result(distinct: true)
    #
    # respond_to do |format|
    #   format.html {}
    #   format.json {
    #     @ideas = @ideas.limit(5)
    #     @teams = @teams.limit(5)
    #   }

    # end
    return if query.blank?

    @ideas = Idea.our_first_query(query)
  end
end
