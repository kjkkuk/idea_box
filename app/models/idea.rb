# frozen_string_literal: true

# == Schema Information
#
# Table name: ideas
#
#  id                      :bigint           not null, primary key
#  idea_name               :string(225)      not null
#  idea_description        :string           not null
#  need                    :string           not null
#  geo                     :string           not null
#  problem                 :string(225)      not null
#  industry                :string           not null
#  visible                 :boolean          not null
#  teams_id                :bigint
#  users_id                :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#
class Idea < ApplicationRecord
  has_many :feedbacks, dependent: :destroy, foreign_key: :ideas_id, inverse_of: :idea
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :subscribe_ideas, dependent: :destroy, foreign_key: :ideas_id, inverse_of: :idea
  belongs_to :user, inverse_of: :ideas, foreign_key: :users_id
  belongs_to :team, inverse_of: :ideas, foreign_key: :teams_id, optional: true

  validates :idea_name, :need, :geo, :industry, presence: true, length: { maximum: 50 }
  validates :idea_description, :problem, presence: true, length: { maximum: 300 }
  validates :visible, inclusion: { in: [true, false] }
  acts_as_votable
  is_impressionable

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

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

  NEED = ['Funding', 'Mentoring', 'Marketing strategy', 'Team members'].freeze

  def self.impressions
    Impression.where(impressionable_type: 'Idea')
  end

  settings index: { number_of_shards: 1 } do
    mapping dynamic: 'false' do
      indexes :id, type: :integer
      indexes :idea_name, type: :text, analyzer: :english
      indexes :idea_description, type: :text, analyzer: :english
      indexes :need, type: :text, analyzer: :english
      indexes :geo, type: :text, analyzer: :english
      indexes :problem, type: :text, analyzer: :english
      indexes :industry, type: :text, analyzer: :english
      indexes :topic, type: :keyword
    end
  end

  def self.our_first_query(query)
    search(query: { multi_match: { query: query, fields: %w(idea_name idea_description^5) } })
  end
end
