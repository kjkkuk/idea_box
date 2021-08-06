# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :role, presence: true

  enum role: %w(admin user).freeze
end
