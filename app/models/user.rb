# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string(225)      not null
#  last_name  :string(225)      not null
#  email      :string(225)      not null
#  role_id    :bigint
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

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { scope: :user_id }
end
