require "application_system_test_case"

class SubdomainsTest < ApplicationSystemTestCase
  setup do
    @subdomain = subdomains(:one)
  end

  test "visiting the index" do
    visit subdomains_url
    assert_selector "h1", text: "Subdomains"
  end

  test "should create subdomain" do
    visit subdomains_url
    click_on "New subdomain"

    fill_in "Domain", with: @subdomain.domain_id
    fill_in "Name", with: @subdomain.name
    click_on "Create Subdomain"

    assert_text "Subdomain was successfully created"
    click_on "Back"
  end

  test "should update Subdomain" do
    visit subdomain_url(@subdomain)
    click_on "Edit this subdomain", match: :first

    fill_in "Domain", with: @subdomain.domain_id
    fill_in "Name", with: @subdomain.name
    click_on "Update Subdomain"

    assert_text "Subdomain was successfully updated"
    click_on "Back"
  end

  test "should destroy Subdomain" do
    visit subdomain_url(@subdomain)
    click_on "Destroy this subdomain", match: :first

    assert_text "Subdomain was successfully destroyed"
  end
end
