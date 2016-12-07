require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#	before { @user = FactoryGirl.build(:user) }
#  subject { @user }
before :each do 
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = FactoryGirl.create :user
  sign_in @user
end
describe "index method test" do
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
  describe "show method test" do
    render_views
    before(:each) do
      @user.save
    end

    it "show user name" do
      get :show, id:  @user.id
      expect(assigns[:user].email).to eq @user.email
    end

    it "show user name" do
      get :show, id:  @user.id
      expect(assigns[:user].userName).to eq "user name"
    end
    
     it "show admin flag" do
      get :show, id:  @user.id
      expect(assigns[:user].admin).to eq true
    end
  end


   describe "create method test" do
    render_views
    @book_attributes = FactoryGirl.attributes_for :user
    subject { post :create, :user => { email:"a_a@a.com",admin:false,password:"123456789",password_confirmation:"123456789",userName:"username"}}

    it "redirects to user_url(@user)" do
      expect(subject).to redirect_to(user_url(assigns(:user)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:user).id
    end

    it "redirects_to(@user)" do
      expect(subject).to redirect_to(assigns(:user))
    end

    it "redirects_to /users/:id" do
      expect(subject).to redirect_to("/users/#{assigns(:user).id}")
    end
  end

  describe "create method test2" do
    before(:each) do
      @user_attributes = FactoryGirl.attributes_for :user
      post :create, { id: @user.id, user: @user_attributes }
    end

    it "create email properly" do
      expect(assigns[:user].email).to eq @user_attributes[:email]
    end

    it "create user name properly" do
      expect(assigns[:user].userName).to eq @user_attributes[:userName]
    end

    it "create password properly" do
      expect(assigns[:user].password).to eq @user_attributes[:password]
    end

    it "create  admin flag properly" do
      expect(assigns[:user].admin).to eq @user_attributes[:admin]
    end
  end
  
  describe "new method test" do
    render_views
    it "re-renders the new method" do
      get :new 
      expect(response).to render_template("new")
    end
   
   end
  describe "update method test" do
    render_views
    before(:each) do
      @user.save
      patch :update, {  id: @user.id,
            user: { email:"a_a@a.com",admin:false,password:"123456789",password_confirmation:"123456789",userName:"username"} }
      end
      it "update email" do
        expect(assigns[:user].email).to eql "a_a@a.com"
      end

      it "update admin flag" do
        expect(assigns[:user].admin).to eql false
      end

      it "update email" do
        expect(assigns[:user].userName).to eql "username"
      end

      it "update password" do
        expect(assigns[:user].password).to eql "123456789"
      end
  end

describe 'DELETE #destroy' do
  context "success" do
    it "deletes the user" do
      expect{ 
        delete :destroy, {  id: @user.id,
            user: { email: @user.email,admin: @user.admin,password: @user.password,
                    password_confirmation: @user.password_confirmation,userName: @user.userName} }
     }.to change(User, :count).by(-1)
    end

  end
end

end