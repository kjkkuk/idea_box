# frozen_string_literal: true

class TeamVersions < PaperTrail::Version
  scope :for_date_range, lambda { |start_date, end_date|
    where(created_at: start_date.beginning_of_day..end_date.end_of_day)
    select(:ip_address).distinct.group('date(created_at)')
  }

  scope :count_by_date, lambda {
    group('date(created_at)').count
  }

  scope :date_and_count, lambda {
  }

  scope :uniq_count_by_date, lambda {
    select(:ip_address).distinct.group('date(created_at)').count
  }
end
