require "test_helper"
require 'minitest/mock'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has first name" do
    assert_equal "Muhummud", users(:regular).first_name
  end

  test "can update first name" do
    users(:regular).update(first_name: "Regular")
    assert_equal "Regular", users(:regular).first_name
  end

  # test "created timestamp should be set to the current time" do
  #   freeze_time
  #   assert_equal Time.current, User.create.created_at
  # end

  # test "has 7 day free trial" do
  #   travel 1.day do
  #     assert_equal 7.days.from_now, User.create.trial_ends_at
  #   end
  # end

  # test "on trial" do
  #   user = User.create
  #   assert user.on_trial?
  # end

  # test "off trial after trial period" do
  #   user = User.create
  #   travel_to 14.days.from_now do
  #     assert_not user.on_trial?
  #   end
  # end

  # test 'stripe trial' do
  #   travel_to(VCR.current_cassette.originally_recorded_at || Time.current) do
  #   end
  # end

  test "geocode" do
    user = users(:regular)

    mock = Minitest::Mock.new
    mock.expect :geocode, [1, -1], [user.address]

    user.geocode(service: mock)

    assert_equal 1, user.latitude
    assert_equal -1, user.longitude

    assert_mock mock
  end
end
