require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should fail saving user" do
    user = User.new
    user.email = "penayo@"

    assert_not user.save, user.errors.full_messages_for(:email)

    user2 = User.new
    user.email = "email@gmail.com"
    user.password = "my-password"

    user2.email = "email@gmail.com"

    assert user.save, user.errors.to_hash
    assert_not user2.save, "#Errors list: #{user2.errors.full_messages_for(:email)}"
  end
end
