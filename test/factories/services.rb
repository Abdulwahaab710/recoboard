# == Schema Information
#
# Table name: services
#
#  id         :integer          not null, primary key
#  name       :string
#  product    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :service do
    name { "MyString" }
    product { "MyString" }
  end
end
