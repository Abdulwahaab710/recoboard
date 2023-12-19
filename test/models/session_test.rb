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
require "test_helper"

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
