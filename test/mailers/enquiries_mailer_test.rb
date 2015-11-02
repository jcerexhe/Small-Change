require 'test_helper'

class EnquiriesMailerTest < ActionMailer::TestCase
  test "new_enquiry_notification" do
    mail = EnquiriesMailer.new_enquiry_notification
    assert_equal "New enquiry notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
