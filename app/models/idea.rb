# frozen_string_literal: true

# == Schema Information
#
# Table name: ideas
#
#  id               :bigint           not null, primary key
#  idea_name        :string(225)      not null
#  idea_description :string           not null
#  need             :string           not null
#  geo              :string           not null
#  problem          :string(225)      not null
#  industry         :string           not null
#  visible          :boolean          not null
#  teams_id         :bigint
#  users_id         :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Idea < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user, inverse_of: :ideas, foreign_key: :users_id
  belongs_to :team, inverse_of: :ideas, foreign_key: :teams_id

  validates :idea_name, :need, :geo, :industry, presence: true, length: { maximum: 50 }
  validates :idea_description, :problem, presence: true, length: { maximum: 300 }
  validates :visible, inclusion: { in: [true, false] }

  INDUSTRY = %w(Art
                Comics
                Crafts
                Dance
                Design
                Film&Video
                Food
                Games
                Journalism
                Music
                Photography
                Publishing
                Technology
                Theater).freeze

  GEO = ['Asia', 'Europe', 'Africa', 'Australia', 'North America', 'South America', 'Global'].freeze

  NEED = ['funding', 'mentoring', 'marketing strategy'].freeze
end
