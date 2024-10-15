# typed: strict
# frozen_string_literal: true

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
class Service < ApplicationRecord
  has_many :ports, dependent: :destroy

  sig { returns(T::Boolean) }
  def http?
    name =~ /http/
  end
end
