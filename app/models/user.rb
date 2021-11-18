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
#  sponsor_id             :bigint
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github, :google_oauth2, :linkedin]

  attr_accessor :auth, :current_user
  attr_writer :sponsor_profile_exists

  before_validation :set_default_role, on: [:create]

  belongs_to :role
  has_many :subscribe_ideas, dependent: :destroy, foreign_key: :users_id, inverse_of: :user
  has_many :authorizations, dependent: :destroy
  has_many :team_members, dependent: :destroy, foreign_key: :users_id, inverse_of: :user
  has_many :teams, through: :team_members, dependent: :destroy
  has_many :ideas, dependent: :destroy, inverse_of: :user, foreign_key: :users_id
  has_many :feedbacks, dependent: :destroy, foreign_key: :users_id, inverse_of: :user
  has_many :comments, dependent: :destroy
  belongs_to :sponsor, optional: true

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }

  accepts_nested_attributes_for :sponsor

  has_one_attached :profile_picture, dependent: :destroy
  validates :profile_picture, content_type: [:png, :jpg, :jpeg]

  acts_as_voter

  def sponsor_profile_exists
    !!sponsor_id
  end

  def self.create_user
    @auth = request.env['omniauth.auth']
    auth = @auth
    joins(:authorizations).where(authorizations: { provider: auth.provider,
                                                   uid: auth.uid }).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name
    end
  end

  def self.create_own_user(auth)
    User.create!(
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      first_name: auth.info.name.split.first,
      last_name: auth.info.name.split.last
    )
  end

  def self.detect_auth(auth)
    Authorization.find_or_initialize_by(
      provider: auth.provider,
      uid: auth.uid.to_s,
      secret: auth.credentials.secret
    ) do |db_auth|
      db_auth.token = auth.credentials.token
    end
  end

  def self.from_omniauth(auth, current_user)
    authorization = detect_auth(auth)
    if authorization.user.blank?
      user = current_user.nil? ? User.where(email: auth['info']['email']).first : current_user
      user = create_own_user(auth) if user.blank?
      authorization.user_id = user.id
      authorization.save!
    end
    authorization.user
  end

  private

  def set_default_role
    self.role ||= Role.find_or_create_by(role: 'user')
  end
end
