# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  dislike    :integer
#  like       :integer
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
