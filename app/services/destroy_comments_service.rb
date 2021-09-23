# frozen_string_literal: true

class DestroyCommentsService < ApplicationService
  attr_reader :id, :user, :article

  def initialize(id, user, article)
    @id = id
    @user = user
    @article = article
    super()
  end

  def call
    comment = @idea.comments.find(@id)
    comment.destroy
  end
end
