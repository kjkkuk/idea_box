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
require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
