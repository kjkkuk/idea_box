# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  belongs_to :role

  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
