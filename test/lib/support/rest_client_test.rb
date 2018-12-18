# frozen_string_literal: true

require 'test_helper'

class RestClientTest < ActiveSupport::TestCase
  setup do
    @insecure_url = 'http://example.com'
    @secure_url   = 'https://example.com'
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

  test 'makes sure that :code works correctly' do
    fatal_error_url = @insecure_url + '/fatal_error'

    stub_request(:get, fatal_error_url).to_return(status: 500)

    assert_equal RestClient.get(fatal_error_url).code, 500
  end

  test 'makes sure that :decode works correctly' do
    json_response_url = @insecure_url + '/json_response'

    stub_request(:get, json_response_url).to_return(body: '{ "foo": "bar" }')

    assert_equal RestClient.get(json_response_url).decode, 'foo' => 'bar'
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
    timeout_url = @insecure_url + '/timeout'

    stub_request(:get, timeout_url).to_timeout

    assert_raise Net::OpenTimeout do
      RestClient.get(timeout_url, open_timeout: 1)
    end
  end

  test 'makes sure that it works correctly with header' do
    header_url = @insecure_url + '/headers'

    stub_request(:get, header_url).with(headers: { foo: 'bar' })

    assert RestClient.get(header_url, header: { foo: 'bar' })
  end

  test 'makes sure that it works correctly with body' do
    body_url = @insecure_url + '/body'

    stub_request(:post, body_url).with(body: 'foo')

    assert RestClient.post(body_url, payload: 'foo')
  end
end
