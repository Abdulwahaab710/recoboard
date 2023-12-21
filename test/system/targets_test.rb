require "application_system_test_case"

class TargetsTest < ApplicationSystemTestCase
  setup do
    @target = targets(:one)
  end

  test "visiting the index" do
    visit targets_url
    assert_selector "h1", text: "Targets"
  end

  test "should create target" do
    visit targets_url
    click_on "New target"

    fill_in "Name", with: @target.name
    fill_in "Program url", with: @target.program_url
    click_on "Create Target"

    assert_text "Target was successfully created"
    click_on "Back"
  end

  test "should update Target" do
    visit target_url(@target)
    click_on "Edit this target", match: :first

    fill_in "Name", with: @target.name
    fill_in "Program url", with: @target.program_url
    click_on "Update Target"

    assert_text "Target was successfully updated"
    click_on "Back"
  end

  test "should destroy Target" do
    visit target_url(@target)
    click_on "Destroy this target", match: :first

    assert_text "Target was successfully destroyed"
  end
end
