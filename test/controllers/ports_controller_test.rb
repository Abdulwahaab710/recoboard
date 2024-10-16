require "test_helper"

class PortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @port = ports(:one)
  end

  test "should get index" do
    get ports_url
    assert_response :success
  end

  test "should get new" do
    get new_port_url
    assert_response :success
  end

  test "should create port" do
    assert_difference("Port.count") do
      post ports_url, params: { port: { number: @port.number, open: @port.open, service_id: @port.service_id, service_version: @port.service_version, ssl: @port.ssl, subdomain_id: @port.subdomain_id } }
    end

    assert_redirected_to port_url(Port.last)
  end

  test "should show port" do
    get port_url(@port)
    assert_response :success
  end

  test "should get edit" do
    get edit_port_url(@port)
    assert_response :success
  end

  test "should update port" do
    patch port_url(@port), params: { port: { number: @port.number, open: @port.open, service_id: @port.service_id, service_version: @port.service_version, ssl: @port.ssl, subdomain_id: @port.subdomain_id } }
    assert_redirected_to port_url(@port)
  end

  test "should destroy port" do
    assert_difference("Port.count", -1) do
      delete port_url(@port)
    end

    assert_redirected_to ports_url
  end
end
