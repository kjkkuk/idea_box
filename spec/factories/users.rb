# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string(225)      not null
#  last_name              :string(225)      not null
#  email                  :string           default(""), not null
#  role_id                :bigint
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
FactoryBot.define do
  factory :user do
    first_name { Faker::FunnyName.name.split.first }
    last_name { Faker::FunnyName.name.split.last }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { create(:role, role: 'user') }
  end
end
