require "application_system_test_case"

class TipsTest < ApplicationSystemTestCase
  test 'Checking tip if it is pluralized or singularized' do
    user = User.new email:'user@epfl.ch', name:'Kyle'
    user.save!
    tip1 = Tip.new title:'tip title', body:'tip body', user_id:user.id
    tip1.save!

    visit(user_path(user))
    assert page.has_content?("Has created 1 tip")

    tip2 = Tip.new title:'tip title', body:'tip body', user_id:user.id
    tip2.save!

    visit(user_path(user))
    assert page.has_content?("Has created 2 tips")
  end
end

