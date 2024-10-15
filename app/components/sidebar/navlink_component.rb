# typed: strict
# frozen_string_literal: true

module Sidebar
  class NavlinkComponent < ApplicationComponent
    sig { params(title: String, path: String, unread_count: Integer).void }
    def initialize(title:, path:, unread_count: 0)
      @title = title
      @path = path
      @unread_count = unread_count
    end

    private

    sig { returns(T::Boolean) }
    def active_link?
      request.path == @path
    end

    sig { returns(String) }
    def color
      active_link? ? "text-gray-300" : "text-gray-400 hover:text-gray-300"
    end
  end
end
