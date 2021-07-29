# frozen_string_literal: true

# == Schema Information
#
# Table name: sponsors
#
#  id          :bigint           not null, primary key
#  industry    :string           not null
#  geo         :string           not null
#  opportunity :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class SponsorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
