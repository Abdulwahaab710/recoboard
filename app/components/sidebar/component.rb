# typed: strict
# frozen_string_literal: true

module Sidebar
  class Component < ApplicationComponent
    sig { params(title: String).void }
    def initialize(title:)
      @title = title
    end

    renders_one :navlinks
  end
end
