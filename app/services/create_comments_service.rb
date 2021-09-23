# frozen_string_literal: true

class CreateCommentsService < ApplicationService
  attr_reader :params, :user, :idea

  def initialize(params, user, idea)
    @params = params
    @user = user
    @idea = idea
    super()
  end

  def call
    comment = Comment.new(@params)
    comment.user = @user
    comment.idea = @idea
    comment.save
  end
end
