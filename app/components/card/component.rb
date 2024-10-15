# typed: strict
# frozen_string_literal: true

module Card
  class Component < ApplicationComponent
    renders_one :header
    renders_one :footer

    sig { void }
    def initialize
    end

    # class CardHeader < ViewComponent::Slot
    # end
    #
    # class CardFooter < ViewComponent::Slot
    # end
  end
end
