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
class Idea < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :team
end
