require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  ##Test columns
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:userName) }
  it { should respond_to(:admin) }

  ##Test validation
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password)}
  it { should validate_presence_of(:password_confirmation)}
  it { should validate_presence_of(:userName)}
end