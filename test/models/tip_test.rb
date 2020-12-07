require 'test_helper'

class TipTest < ActiveSupport::TestCase

  test 'presence of the title' do
    tip = Tip.new body:'body'
    refute tip.valid?
  end

  test 'presence of the body' do
    tip = Tip.new title:'title'
    refute tip.valid?
  end

  test 'maximum lenght of the title' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'this title is too long for being a tip title this title is too long for being a tip title this title is too long for being a tip title', body: 'tip - body', user: user
    
    refute tip.valid?
  end
  
  test 'changing the title of tip' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    updated_time = tip.updated_at

    tip.title = 'new title for tip'
    tip.save!

    refute_equal tip.updated_at, updated_time
  end

  test 'changing the body of tip' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    updated_time = tip.updated_at

    tip.body = 'new body for tip'
    tip.save!

    refute_equal tip.updated_at, updated_time
  end

  test 'no matching results' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    assert_empty Tip.search('new title')
  end

  test 'one matching result from search' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    assert_equal Tip.search('new tip').length, 1
  end

  test 'two matching results' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip1 = Tip.new title: 'title for tip1', body: 'tip1 - body', user: user
    tip1.save!

    tip2 = Tip.new title: 'title for tip2', body: 'tip2 - body', user: user
    tip2.save!

    assert_equal Tip.search('title').length, 2
  end

  test 'most_recent with six tips' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!

    6.times do |i|
      tip = Tip.new title: "title#{i+1} for the tip", body: 'tip - body', user: user
      tip.save!
    end

    assert_equal Tip.most_recent().length, 4
    assert_equal Tip.most_recent.first.title, "title6 for the tip"
    refute_equal Tip.most_recent[0].title, "title1 for the tip"
    refute_equal Tip.most_recent[1].title, "title1 for the tip"
    refute_equal Tip.most_recent[2].title, "title1 for the tip"
    refute_equal Tip.most_recent[3].title, "title1 for the tip"
    refute_equal Tip.most_recent[0].title, "title2 for the tip"
    refute_equal Tip.most_recent[1].title, "title2 for the tip"
    refute_equal Tip.most_recent[2].title, "title2 for the tip"
    refute_equal Tip.most_recent[3].title, "title2 for the tip"
  end

  test 'search with title' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    assert_equal Tip.search('new tip').length, 1
  end 

  test 'search with body' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip = Tip.new title: 'new tip', body: 'tip - body', user: user
    tip.save!

    assert_equal Tip.search('body').length, 1
  end  

  test 'search with body and title' do
    user = User.new email:'new@extensionschool.ch', password: 'password'
    user.save!
    tip1 = Tip.new title: 'title1 for tip1', body: 'hello tip2', user: user
    tip1.save!
    tip2 = Tip.new title: 'title2 for tip2', body: 'hello tip1', user: user
    tip2.save!
    
    assert_equal Tip.search('tip1').length, 2
  end
end