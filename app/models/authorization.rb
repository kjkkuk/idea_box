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

  after_create :fetch_details

  def fetch_details
    public_send("fetch_details_from_#{provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(token)
    facebook_data = graph.get_object('me')
    self.username = facebook_data['username']
    save
  end
end
