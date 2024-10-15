# == Schema Information
#
# Table name: subdomains
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  domain_id  :integer          not null
#
# Indexes
#
#  index_subdomains_on_domain_id  (domain_id)
#  index_subdomains_on_name       (name) UNIQUE
#
# Foreign Keys
#
#  domain_id  (domain_id => domains.id)
#
require "test_helper"

class SubdomainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
