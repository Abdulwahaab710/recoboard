# typed: strict
# frozen_string_literal: true

module DialogButton
  class Component < ApplicationComponent
    sig { params(path: String, style: Symbol).void }
    def initialize(path:, style: :primary)
      @style = style
      @path = path
    end
  end
end
