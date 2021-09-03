# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ideas', type: :controller do
  describe 'index' do
    it 'assigns all teams as @@teams' do
      get :index
      expect(assigns(:ideas)).to eq([idea])
    end
  end
end
