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
class Sponsor < ApplicationRecord
  belongs_to :user

  validates :opportunity, :geo, :industry, presence: true, length: { maximum: 50 }
end
