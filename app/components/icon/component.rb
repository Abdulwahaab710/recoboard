# typed: false
# frozen_string_literal: true

module Icon
  class IconNotFoundError < StandardError; end

  class Component < ViewComponent::Base
    def initialize(name:, size: 24)
      @name = name
      @size = size
      super
    end

    private

    attr_reader :name, :size

    def show_svg
      svg_path = Rails.root.join("app/components/icon/icons/#{name}.svg")

      raise IconNotFoundError, "Icon not found: #{name}" unless File.exist?(svg_path)

      render file: Rails.root.join("app/components/icon/icons/#{@name}.svg")
    end
  end
end
