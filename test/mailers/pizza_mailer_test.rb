require 'test_helper'

class PizzaMailerTest < ActionMailer::TestCase
  test "send_order" do
    mail = PizzaMailer.send_order
    assert_equal "Send order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_report" do
    mail = PizzaMailer.send_report
    assert_equal "Send report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
