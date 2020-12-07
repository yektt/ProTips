require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test 'presence of the body' do
    user = User.new email:'user@epfl.ch', name:'Kyle', password:'password'
    user.save!
    tip = Tip.new title:'tip title', body:'tip body', user:user
    tip.save!

    comment = Comment.new user: user, tip: tip

    refute comment.valid?
  end
  
  test 'cascading save' do
    user = User.new email:'user@epfl.ch', name:'Kyle', password:'password'
    user.save!
    tip = Tip.new title:'tip title', body:'tip body', user:user
    tip.save!

    comment = Comment.new body: "It is a comment!", user: user, tip: tip
    tip.comments << comment
    tip.save
  
    assert_equal comment, Comment.first
  end 
end
