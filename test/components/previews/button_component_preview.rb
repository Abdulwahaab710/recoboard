# typed: false
# frozen_string_literal: true

class ButtonComponentPreview < Lookbook::Preview
  # @param type select { choices: [button, submit] } "The type of the input field"
  def standard(type: :button)
    render Button::Component.new(type:) do
      "Button"
    end
  end
end
