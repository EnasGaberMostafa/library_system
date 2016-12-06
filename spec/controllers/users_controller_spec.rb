require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#	before { @user = FactoryGirl.build(:user) }
#  subject { @user }
before :each do 
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = FactoryGirl.create :user
  sign_in @user
end
describe "GET #index" do
    render_views
   

    it "should be successful" do 
      get :index
      expect(response).to be_success
    end

    it "should render index template" do 
      get :index
      expect(response).to render_template(:index)
    end
  end



end