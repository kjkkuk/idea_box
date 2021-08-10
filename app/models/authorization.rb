# frozen_string_literal: true

# == Schema Information
#
# Table name: authorizations
#
#  id         :bigint           not null, primary key
#  provider   :string
#  uid        :string
#  user_id    :integer
#  token      :string
#  secret     :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Authorization < ApplicationRecord
  belongs_to :user
end
