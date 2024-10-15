# typed: strict
# frozen_string_literal: true

module Input
  class Component < ApplicationComponent
    sig do
      params(
        type: Symbol,
        id: T.nilable(T.any(String, Symbol)),
        value: T.nilable(String),
        name: T.nilable(String),
        required: T::Boolean,
        placeholder: T.nilable(String),
        label: T.nilable(String),
      ).void
    end
    def initialize(type:, id: nil, value: nil, name: nil, required: false, placeholder: nil, label: nil)
      @input_attributes = T.let(
        {
          type: type,
          id: id || name,
          value: value,
          name: name,
          required: required,
          placeholder: placeholder,
        }.compact,
        T::Hash[Symbol, T.any(String, Symbol, T::Boolean)],
      )

      @label = T.let(label, T.nilable(String))
      super
    end
  end
end
