# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:user) { create(:user) }
  let!(:idea) { create(:idea) }
  let(:valid_attributes) { attributes_for(:idea) }

  describe 'index' do
    it 'assigns all ideas as @@ideas' do
      get :index
      expect(assigns(:ideas)).to eq([idea])
    end
  end
end
