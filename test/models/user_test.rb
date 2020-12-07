require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'email is lowercase before validation' do 
    user = User.new email:'nEW@EpFl.ch', password: 'password'
    user.save!

    assert_equal user.email, 'new@epfl.ch'
  end

  test 'user cannot be exist without password' do 
    user = User.new email:'new@epfl.ch'
    
    refute user.valid?
  end
end
