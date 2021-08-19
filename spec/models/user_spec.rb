# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'Associations' do
    it { is_expected.to have_many(:authorizations) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:feedbacks) }
    it { is_expected.to have_many(:teams) }
    it { is_expected.to have_many(:team_members) }
    it { is_expected.to have_many(:ideas) }
  end

  describe 'Validations' do
    let(:valid_user) { build(:user) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }

    it 'is valid with a name, email, password' do
      expect(valid_user).to be_valid
    end
  end
end
