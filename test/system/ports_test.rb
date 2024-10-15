require "application_system_test_case"

class PortsTest < ApplicationSystemTestCase
  setup do
    @port = ports(:one)
  end

  test "visiting the index" do
    visit ports_url
    assert_selector "h1", text: "Ports"
  end

  test "should create port" do
    visit ports_url
    click_on "New port"

    fill_in "Number", with: @port.number
    check "Open" if @port.open
    fill_in "Service", with: @port.service_id
    fill_in "Service version", with: @port.service_version
    check "Ssl" if @port.ssl
    fill_in "Subdomain", with: @port.subdomain_id
    click_on "Create Port"

    assert_text "Port was successfully created"
    click_on "Back"
  end

  test "should update Port" do
    visit port_url(@port)
    click_on "Edit this port", match: :first

    fill_in "Number", with: @port.number
    check "Open" if @port.open
    fill_in "Service", with: @port.service_id
    fill_in "Service version", with: @port.service_version
    check "Ssl" if @port.ssl
    fill_in "Subdomain", with: @port.subdomain_id
    click_on "Update Port"

    assert_text "Port was successfully updated"
    click_on "Back"
  end

  test "should destroy Port" do
    visit port_url(@port)
    click_on "Destroy this port", match: :first

    assert_text "Port was successfully destroyed"
  end
end
