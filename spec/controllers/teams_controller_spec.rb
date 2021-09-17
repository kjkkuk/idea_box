# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:user) { create(:user) }
  let!(:team) { create(:team) }
  let(:valid_attributes) { attributes_for(:team) }
  let(:invalid_attributes) { attributes_for(:team, group: nil) }

  before { sign_in(user) }

  describe 'index' do
    it 'assigns all teams as @@teams' do
      get :index
      expect(assigns(:teams)).to eq([team])
    end
  end

  describe 'new' do
    it 'assigns a new team to @team' do
      get :new
      expect(assigns(:team)).to be_a_new(Team)
    end
  end
end
