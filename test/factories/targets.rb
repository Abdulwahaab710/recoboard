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
FactoryBot.define do
  factory :target do
    name { "MyString" }
    program_url { "MyString" }
  end
end
