require "test_helper"

class PersonTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper
  setup do
    @person = people(:one)
  end
  
  test "has no score by default" do
    assert_nil @person.score
  end

  test "sends nps email" do
    assert_emails 1 do
      @person.send_nps_email
    end

    assert_enqueued_email_with PersonMailer, :nps, args: [@person] do
      @person.send_nps_email
    end
  end
end
