# == Schema Information
#
# Table name: ports
#
#  id              :integer          not null, primary key
#  number          :integer
#  open            :boolean
#  service_version :string
#  ssl             :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_id      :integer          not null
#  subdomain_id    :integer          not null
#
# Indexes
#
#  index_ports_on_service_id    (service_id)
#  index_ports_on_subdomain_id  (subdomain_id)
#
# Foreign Keys
#
#  service_id    (service_id => services.id)
#  subdomain_id  (subdomain_id => subdomains.id)
#
require "test_helper"

class PortTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
