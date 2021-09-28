# frozen_string_literal: true

class SubscribeIdeaController < ApplicationController
  def subscribe
    SubscribeIdea.create!(users_id: current_user.id, ideas_id: params[:id])
    redirect_to idea_path(params[:id])
  end

  def unsubscribe
    current_user.subscribe_ideas.find_by(ideas_id: params[:id]).destroy
    redirect_to idea_path(params[:id])
  end
end
