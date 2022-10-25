require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save user with correct fields' do 
      @user = User.create(
        'name' => 'John Doe',
        'email' => 'john@doe.com',
        'password' => 'password',
        'password_confirmation' => 'password'
      )
      expect(@user).to be_valid
    end

    it 'should not save user if passwords do not match' do 
      @user = User.create(
        'name' => 'John Doe',
        'email' => 'john@doe.com',
        'password' => 'password',
        'password_confirmation' => 'notright'
      )
      expect(@user).not_to be_valid
    end

    it'should not save with duplicate email' do
      @user = User.create(
        'name' => 'John Doe',
        'email' => 'john@doe.com',
        'password' => 'password',
        'password_confirmation' => 'password'
      )
      @user2 = User.create(
        'name' => 'John Doe',
        'email' => 'JOHN@DOE.COM',
        'password' => 'password',
        'password_confirmation' => 'password'
      )
      expect(@user2).not_to be_valid
    end

    it 'should not save user if passwords is too short' do 
      @user = User.create(
        'name' => 'John Doe',
        'email' => 'john@doe.com',
        'password' => 'pass',
        'password_confirmation' => 'pass'
      )
      expect(@user).not_to be_valid
    end
  end
end
