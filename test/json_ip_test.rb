require 'test_helper'
require 'minitest/mock'

class JsonIpTest < ActiveSupport::TestCase

    setup do
        VCR.insert_cassette(name)
    end

    teardown do
        VCR.eject_cassette
    end

    test "should return an ip address" do
        api = JsonIp.new
        api.stub :response, { "ip" => "1.2.3.4" }  do
            assert_equal "1.2.3.4", api.ip
        end
    end

    test "handles malformed responses" do
        api = JsonIp.new
        api.stub :response, "" do
            assert_nil api.ip
        end
    end
end