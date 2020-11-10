require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase

  test 'Checking comment.s on a tip if it is pluralized or singularized' do
    user = User.new email:'user@epfl.ch', name:'Kyle'
    user.save!
    tip = Tip.new title:'tip title', body:'tip body', user_id:user.id
    tip.save!
    comment1 = Comment.new body:'comment1 body', user_id:user.id, tip_id:tip.id
    comment1.save!

    visit(tips_path(tip))
    assert page.has_content?("1 comment on this tip")

    comment2 = Comment.new body:'comment2 body', user_id:user.id, tip_id:tip.id
    comment2.save!

    visit(tips_path(tip))
    assert page.has_content?("2 comments on this tip")
  end
end
