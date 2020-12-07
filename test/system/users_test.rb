require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  
  test 'sign up makes user logged in' do 
    visit(new_user_path(locale: :en))
    fill_in('Email', with:'user@extensionschool.ch')
    fill_in('Password', with: 'password')
    find(:button, 'Sign up').click    

    assert page.has_content?('User was successfully created.')
    assert_equal User.first.email, 'user@extensionschool.ch'
    assert page.has_content?('Account')
  end

  test 'anonymous user can use two locales' do
    visit(root_path(locale: :en))

    assert page.has_content?('Sign up')

    find(:link, 'FR').click
    assert page.has_content?("S'inscrire")
  end

  test 'logged in user can use two locales' do
    user = User.new email:'user@extensionschool.ch', password:'password'
    user.save!

    visit(new_session_path(locale: :en))
    fill_in(:email, with: user.email)
    fill_in(:password, with: user.password)

    find(:button, 'Log in').click
    assert page.has_content?('Account')

    find(:link, 'FR').click
    assert page.has_content?('Compte')
  end

  test 'anonymous user can not add a comment' do
    user = User.new email:'user@epfl.ch', name:'Kyle', password:'password'
    user.save!
    tip = Tip.new title:'tip title', body:'tip body', user: user
    tip.save!

    visit(tip_path(tip, locale: :en))
    assert page.has_no_content?('Add your own comment')
  end
end
