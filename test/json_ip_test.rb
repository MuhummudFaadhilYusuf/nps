require 'test_helper'

class JsonIpTest < ActiveSupport::TestCase

    setup do
        VCR.insert_cassette(name)
    end

    teardown do
        VCR.eject_cassette
    end

    test "should return an ip address" do
            assert_equal "192.248.150.126", JsonIp.ip
    end
end