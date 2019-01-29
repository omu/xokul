# frozen_string_literal: true

require 'test_helper'

class RestClientTest < ActiveSupport::TestCase
  setup do
    # Base URL.
    @insecure_url = 'http://example.com'
    @secure_url   = 'https://example.com'

    # URLs derived from the insecure base URL.
    @body_url    = @insecure_url + '/body'
    @error_url   = @insecure_url + '/error'
    @header_url  = @insecure_url + '/header'
    @rest_url    = @insecure_url + '/rest'
    @timeout_url = @insecure_url + '/timeout'
  end

  test 'makes sure that supported HTTP methods work correctly' do
    RestClient::SUPPORTED_HTTP_METHODS.each do |method|
      stub_request(method, @insecure_url)
      assert RestClient.send(method, @insecure_url)
    end
  end

  test 'raises error if called with unsupported HTTP method' do
    assert_raise RestClient::HTTPMethodError do
      RestClient.const_get(:Request).new(:unsupported, @insecure_url).execute
    end
  end

  test 'makes sure that the :ok? works correctly' do
    stub_request(:get, @insecure_url)
    assert RestClient.get(@insecure_url).ok?
  end

  test 'makes sure that the :code works correctly' do
    stub_request(:get, @error_url).to_return(status: 500)
    assert_equal RestClient.get(@error_url).code, 500
  end

  test 'makes sure that the :decode works correctly' do
    stub_request(:get, @rest_url).to_return(body: '{ "foo": "bar" }')
    assert_equal RestClient.get(@rest_url).decode, 'foo' => 'bar'
  end

  test 'raises error if called with invalid HTTP option' do
    assert_raise RestClient::HTTPOptionError do
      RestClient.get(@insecure_url, foo: 'bar')
    end
  end

  test 'makes sure that it works correctly with SSL' do
    stub_request(:post, @secure_url)
    assert RestClient.post(
      @secure_url, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_PEER
    )
  end

  test 'makes sure that timeout works correctly' do
    stub_request(:get, @timeout_url).to_timeout
    assert_raise Net::OpenTimeout do
      RestClient.get(@timeout_url, open_timeout: 1)
    end
  end

  test 'makes sure that it works correctly with header' do
    stub_request(:get, @header_url).with(headers: { foo: 'bar' })
    assert RestClient.get(@header_url, header: { foo: 'bar' })
  end

  test 'makes sure that it works correctly with body' do
    stub_request(:post, @body_url).with(body: 'foo')
    assert RestClient.post(@body_url, payload: 'foo')
  end
end
