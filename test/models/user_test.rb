require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid without name' do
    user = User.new(email: '')
    refute user.valid?, "Email can't be blank"
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end
end
