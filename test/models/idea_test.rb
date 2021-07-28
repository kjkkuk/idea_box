# frozen_string_literal: true

# == Schema Information
#
# Table name: ideas
#
#  id               :bigint           not null, primary key
#  idea_name        :string
#  idea_description :string
#  need             :string
#  geo              :string
#  problem          :string
#  industry         :string
#  visible          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
