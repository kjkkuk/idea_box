# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user_my_module) { build :user_my_module }

  it 'is valid' do
    expect(user_my_module).to be_valid
  end

  # it 'is of class UserMyModule' do
  #   expect(subject.class).to eq UserMyModule
  # end

  describe 'Database table' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :my_module_id }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
    it { is_expected.to have_db_column :assigned_by_id }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :my_module }
    it { is_expected.to belong_to(:assigned_by).class_name('User').optional }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :my_module }
  end
end
