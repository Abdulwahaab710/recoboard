# typed: false
# frozen_string_literal: true

# == Schema Information
#
# Table name: targets
#
#  id          :integer          not null, primary key
#  name        :string
#  program_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_targets_on_name         (name) UNIQUE
#  index_targets_on_program_url  (program_url) UNIQUE
#
require "test_helper"

class TargetTest < ActiveSupport::TestCase
  test "validates name presence" do
    target = Target.new(name: nil)
    assert_not target.valid?
    assert_equal ["can't be blank"], target.errors[:name]
  end
end
