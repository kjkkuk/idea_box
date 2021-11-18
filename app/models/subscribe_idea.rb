# frozen_string_literal: true

# == Schema Information
#
# Table name: subscribe_ideas
#
#  id         :bigint           not null, primary key
#  ideas_id   :bigint
#  users_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SubscribeIdea < ApplicationRecord
  belongs_to :idea, foreign_key: :ideas_id, inverse_of: :subscribe_ideas
  belongs_to :user, foreign_key: :users_id, inverse_of: :subscribe_ideas
end
