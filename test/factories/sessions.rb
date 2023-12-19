# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: sessions
#
#  id             :integer          not null, primary key
#  last_active_at :datetime
#  uuid           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer          not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#  index_sessions_on_uuid     (uuid) UNIQUE
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :session do
    last_active_at { "2023-08-20 20:47:44" }
    uuid { "MyString" }
    user { nil }
  end
end
