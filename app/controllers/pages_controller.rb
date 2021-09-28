# frozen_string_literal: true

class PagesController < ApplicationController
  def show
    render template: "layouts/footer/#{params[:page]}"
  end
end
