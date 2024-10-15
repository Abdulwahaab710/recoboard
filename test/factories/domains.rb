# == Schema Information
#
# Table name: domains
#
#  id               :integer          not null, primary key
#  name             :string
#  subdomains_count :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  target_id        :integer          not null
#
# Indexes
#
#  index_domains_on_name       (name) UNIQUE
#  index_domains_on_target_id  (target_id)
#
# Foreign Keys
#
#  target_id  (target_id => targets.id)
#
FactoryBot.define do
  factory :domain do
    name { "MyString" }
    target { nil }
  end
end
