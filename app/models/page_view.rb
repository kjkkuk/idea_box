# frozen_string_literal: true

# == Schema Information
#
# Table name: impressions
#
#  id                  :bigint           not null, primary key
#  impressionable_type :string
#  impressionable_id   :integer
#  user_id             :integer
#  controller_name     :string
#  action_name         :string
#  view_name           :string
#  request_hash        :string
#  ip_address          :string
#  session_hash        :string
#  message             :text
#  referrer            :text
#  params              :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class PageView < Impression

  scope :for_type, lambda { |type|
    where(impressionable_type: type)
  }

  scope :all_views, lambda { |id|
    where(impressionable_id: id).count
  }

  scope :uniq_all_views, lambda { |id|
    where(impressionable_id: id).select(:ip_address).distinct.count
  }

  scope :for_date_range, lambda { |start_date, end_date|
    where(created_at: start_date.beginning_of_day..end_date.end_of_day)
  }

  scope :count_by_date, lambda {
    group('date(created_at)').count
  }

  scope :uniq_count_by_date, lambda {
    select(:ip_address).distinct.group('date(created_at)').count
  }
end
