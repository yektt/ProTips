require "application_system_test_case"

class TipsTest < ApplicationSystemTestCase
  test 'Checking tip if it is pluralized or singularized' do
    user = User.new email:'user@epfl.ch', name:'Kyle', password:'password'
    user.save!
    tip1 = Tip.new title:'tip title', body:'tip body', user: user
    tip1.save!

    visit(user_path(user, locale: :en))
    assert page.has_content?("Has created 1 tip")

    tip2 = Tip.new title:'tip title', body:'tip body', user: user
    tip2.save!

    visit(user_path(user, locale: :en))
    assert page.has_content?("Has created 2 tips")
  end

  test 'creating a tip' do
    user = User.new email:'user@extensionschool.ch', password:'password'
    user.save!

    visit(new_session_path(locale: :en))
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)

    find(:button, 'Log in').click
    assert page.has_content?("You don't have any tips!")

    find(:link, 'New tip').click
    fill_in('Title', with:'tip title')
    fill_in('Body', with:'tip body')

    click_on('Create Tip')
    assert page.has_content?('tip title')
  end
end

