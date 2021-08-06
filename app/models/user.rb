# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string(225)      not null
#  last_name              :string(225)      not null
#  email                  :string           default(""), not null
#  role_id                :bigint
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :linkedin]

  validates :email, presence: true
  before_validation :set_default_role, on: [:create]
  belongs_to :role

  has_many :authorizations, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members, dependent: :destroy
  has_many :ideas, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      first_name: data['name'].split.first,
      last_name: data['name'].split.last,
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  private

  def set_default_role
    self.role ||= Role.find_by(role: 'user')
  end
end
