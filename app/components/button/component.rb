# typed: strict
# frozen_string_literal: true

module Button
  class Component < ApplicationComponent
    sig do
      params(
        type: Symbol,
        method: T.nilable(Symbol),
        style: T.nilable(Symbol),
        full_width: T::Boolean,
        data: T::Hash[Symbol, T.untyped],
      ).void
    end
    def initialize(type:, method: nil, style: nil, full_width: false, data: {})
      @type = type
      @method = method
      @style = style
      @data = data
      @full_width = full_width
      super
    end

    private

    attr_reader :data

    BASE_STYLE = T.let(
      "w-full py-3 px-5 rounded-md focus:outline-none focus:ring focus:ring-opacity-50",
      String,
    )

    STYLES = T.let(
      {
        primary: "bg-emerald-500 text-white hover:bg-emerald-600 focus:ring-emerald-200",
        secondary: "bg-gray-500 text-white hover:bg-gray-600 focus:ring-gray-200",
        success: "bg-green-500 text-white hover:bg-green-600 focus:ring-green-200",
        danger: "bg-red-500 text-white hover:bg-red-600 focus:ring-red-200",
        warning: "bg-yellow-500 text-white hover:bg-yellow-600 focus:ring-yellow-200",
        info: "bg-blue-500 text-white hover:bg-blue-600 focus:ring-blue-200",
      },
      T::Hash[Symbol, String],
    )

    VALID_STYLES = T.let(STYLES.keys, T::Array[Symbol])

    sig { params(style: Symbol).void }
    def validate_style!(style)
      return if style.nil?

      raise "Invalid style: #{style}" if VALID_STYLES.exclude?(style)
    end

    sig { returns(String) }
    def styles
      return "" if @style.nil?

      "#{BASE_STYLE} #{STYLES[@style]} #{full_width_style}"
    end

    sig { returns(String) }
    def full_width_style
      return "max-w-fit" unless @full_width

      ""
    end
  end
end
