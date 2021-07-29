# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  dislike    :integer          not null
#  like       :integer          not null
#  rating     :float            not null
#  users_id   :bigint
#  ideas_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :like, :dislike, presence: true
  validates :rating, numericality: true

end
