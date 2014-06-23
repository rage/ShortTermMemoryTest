require 'spec_helper'

describe 'Admin' do

  it 'account can be created' do
    admin = Admin.create! do |u|
      u.email = 'sample@sample.com'
      u.password = 'password'
      u.password_confirmation = 'password'
    end

    expect(admin.valid?).to be(true)
    expect(Admin.count).to eq(1)
  end

  it 'account can be deleted' do
    admin = Admin.create! do |u|
      u.email = 'sample@sample.com'
      u.password = 'password'
      u.password_confirmation = 'password'
    end
    expect(admin.valid?).to be(true)
    expect(Admin.count).to eq(1)

    Admin.destroy admin
    expect(Admin.count).to eq(0)

  end

  it 'cant be created without password' do
    admin = Admin.create email: 'sample@sample.com'

    expect(admin).not_to be_valid
    expect(Admin.count).to eq(0)
  end

  it 'cant be created if password length is not 8 chars or more' do
    admin = Admin.create email: 'sample@sample.com', password: 'passwor', password_confirmation: 'passwor'

    expect(admin).not_to be_valid
    expect(Admin.count).to eq(0)
  end

  it 'cant be created without password_confirmation' do
    admin = Admin.create email: 'sample@sample.com', password: 'password'

    expect(admin).not_to be_valid
    expect(Admin.count).to eq(0)
  end
end