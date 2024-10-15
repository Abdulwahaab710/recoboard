# typed: strict
# frozen_string_literal: true

module Link
  class Component < ApplicationComponent
    sig do
      params(
        to: T.anything,
        style: T.nilable(Symbol),
        method: T.nilable(Symbol),
        as: Symbol,
        external: T::Boolean,
        data: T::Hash[Symbol, T.untyped]
      ).void
    end
    def initialize(to:, style: nil, method: nil, as: :link, external: false, data: {})
      @to = to
      @style = style
      @method = method
      @as = as
      @external = external
      @data = data
      super
    end

    private

    BASE_STYLE = T.let("w-full py-3 px-5 rounded-md focus:outline-none focus:ring focus:ring-opacity-50 max-w-fit", String)

    STYLES = T.let({
      primary: "bg-emerald-500 text-white hover:bg-emerald-600 focus:ring-emerald-200",
      secondary: "bg-gray-500 text-white hover:bg-gray-600 focus:ring-gray-200",
      success: "bg-green-500 text-white hover:bg-green-600 focus:ring-green-200",
      danger: "bg-red-500 text-white hover:bg-red-600 focus:ring-red-200",
      warning: "bg-yellow-500 text-white hover:bg-yellow-600 focus:ring-yellow-200",
      info: "bg-blue-500 text-white hover:bg-blue-600 focus:ring-blue-200"
    },
    T::Hash[Symbol, String])

    VALID_STYLES = T.let(STYLES.keys, T::Array[Symbol])

    sig { returns(T::Boolean) }
    def link?
      @as == :link
    end

    sig { params(style: Symbol).void }
    def validate_style!(style)
      return if style.nil?

      raise "Invalid style: #{style}" unless VALID_STYLES.include?(style)
    end

    sig { returns(String) }
    def styles
      return "" if @style.nil?

      "#{BASE_STYLE} #{STYLES[@style]}"
    end
  end
end
