require 'spec_helper'

describe 'Admin page' do
  let!(:admin){ FactoryGirl.create(:admin) }

  it 'sign in page shows sign in boxes' do
    visit rails_admin_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Forgot your password?'
  end

  it 'can be logged in to' do
    visit rails_admin_path
    fill_in('admin_email',with:'hello@world.com')
    fill_in('admin_password',with:'Tsoha123')
    click_button('Sign in')
    expect(page).to have_content 'Site Administration'
    expect(page).to have_content 'Signed in successfully.'
  end

=begin
  it 'forgot your password page works' do
    host! "127.0.0.1"
    visit rails_admin_path
    click_link "Forgot your password?"
    fill_in('admin_email',with:'hello@world.com')
    save_and_open_page
    click_button "Send me reset password instructions"

    expect(page).to have_content 'You will receive an email with instructions on how to reset your password in a few minutes.'
    #save_and_open_page
  end
=end

  it 'import button in Lists view redirects to list import page' do
    visit rails_admin_path
    fill_in('admin_email',with:'hello@world.com')
    fill_in('admin_password',with:'Tsoha123')
    click_button('Sign in')
    expect(page).to have_content 'Lists'
    first(:link, 'Lists').click
    expect(page).to have_content 'List of Lists'
    click_link('Import')
    expect(page).to have_content 'New list'
    expect(page).to have_content 'Harjoituslista'
    click_link('Short Term Memory Test Admin')
    expect(page).to have_content 'Site Administration'
    first(:link, 'Import').click
    expect(page).to have_content 'New list'
    expect(page).to have_content 'Harjoituslista'
    click_link('Short Term Memory Test Admin')
    expect(page).to have_content 'Site Administration'
  end






end
