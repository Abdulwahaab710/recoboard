# typed: strict
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

class Target < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :program_url, presence: true, uniqueness: true, url: true
end
