# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  rating     :integer          not null
#  users_id   :bigint
#  ideas_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  reaction   :boolean
#
class Feedback < ApplicationRecord
  belongs_to :user, foreign_key: :users_id, inverse_of: :feedbacks
  belongs_to :idea, foreign_key: :ideas_id, inverse_of: :feedbacks

  validates :reaction, inclusion: { in: [true, false, nil] }
  validates :rating, numericality: true

  REACTION = [true, false, nil].freeze
end
