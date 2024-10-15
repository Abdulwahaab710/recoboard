# typed: false
# frozen_string_literal: true

class InputComponentPreview < Lookbook::Preview
  layout nil
  # @param type select { choices: [text, password, number, email, url] } "The type of the input field"
  # @param value text "The value of the input"
  # @param id text "The element id"
  # @param name text "The name of the input"
  # @param required toggle "Specifying the input must be filled"
  # @param placeholder text "The placeholder text"
  # @param label text "The label text"
  def standard(type: :text, value: "", id: "", name: "text", required: false, placeholder: "", label: "")
    render Input::Component.new(type:, value:, id:, name:, required:, placeholder:, label:)
  end
end
