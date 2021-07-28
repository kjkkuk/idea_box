# frozen_string_literal: true

# == Schema Information
#
# Table name: sponsors
#
#  id          :bigint           not null, primary key
#  industry    :string
#  geo         :string
#  opportunity :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sponsor < ApplicationRecord
  belongs_to :user
end
