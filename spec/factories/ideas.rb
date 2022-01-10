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
FactoryBot.define do
  factory :idea do
    idea_name { Faker::FunnyName.name }
    idea_description { Faker::GreekPhilosophers.quote }
    need { Idea::NEED.sample }
    problem { Faker::GreekPhilosophers.quote }
    industry { Idea::INDUSTRY.sample }
    geo { Faker::Food.vegetables }
    user { create(:user) }
    visible { true }
  end
end
