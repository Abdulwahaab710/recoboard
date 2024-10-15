# typed: strict
# frozen_string_literal: true

module Typography
  class Component < ApplicationComponent
    VALID_HEADING_TYPES = T.let([:strong, :p, :h1, :h2, :h3, :h4, :h5, :h6], T::Array[Symbol])
    VALID_VARIANTS = T.let(
      ["xs", "sm", "base", "lg", "xl", "2xl", "3xl", "4xl", "5xl", "6xl", "7xl", "8xl", "9xl"],
      T::Array[String],
    )

    sig { params(as: Symbol, variant: T.nilable(String), semibold: T::Boolean).void }
    def initialize(as:, variant: nil, semibold: true)
      validate_heading_type!(as)
      validate_variant!(variant) if variant

      @as = as
      @variant = variant
      @semibold = semibold
      super
    end

    private

    sig { params(variant: String).void }
    def validate_variant!(variant)
      raise ArgumentError, "Invalid variant: #{variant}" unless valid_variant?(variant)
    end

    sig { params(variant: String).returns(T::Boolean) }
    def valid_variant?(variant)
      VALID_VARIANTS.include?(variant)
    end

    sig { params(type: Symbol).void }
    def validate_heading_type!(type)
      raise ArgumentError, "Invalid heading type: #{type}" unless valid_heading_type?(type)
    end

    sig { params(type: Symbol).returns(T::Boolean) }
    def valid_heading_type?(type)
      VALID_HEADING_TYPES.include?(type)
    end

    sig { returns(String) }
    def variant_classname
      return "" unless @variant

      "text-#{@variant}"
    end

    sig { returns(T.nilable(String)) }
    def bold_classname
      "font-semibold" if @semibold
    end
  end
end
