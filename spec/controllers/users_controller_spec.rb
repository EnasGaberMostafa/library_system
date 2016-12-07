require 'rails_helper'

RSpec.describe UsersController, type: :controller do
#	before { @user = FactoryGirl.build(:user) }
#  subject { @user }
before :each do 
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = FactoryGirl.create :user
  sign_in @user
end
# describe "GET #index" do
#     render_views
#     it "should be successful" do 
#       get :index
#       expect(response).to be_success
#     end

#     it "should render index template" do 
#       get :index
#       expect(response).to render_template(:index)
#     end
#   end
  # describe "GET show" do
  #   render_views
  #   before(:each) do
  #     @user.save
  #   end

  #   it "show title" do
  #     get :show, id:  @user.id
  #     expect(assigns[:user].userName).to eq "user name"
  #   end
    
  #    it "show author" do
  #     get :show, id:  @user.id
  #     expect(assigns[:user].admin).to eq true
  #   end
    
  # end


  #  describe "#create" do
  #   render_views
  #   @book_attributes = FactoryGirl.attributes_for :user
  #   subject { post :create, :user => { email:"a_a@a.com",admin:false,password:"123456789",password_confirmation:"123456789",userName:"username"}}

  #   it "redirects to book_url(@widget)" do
  #     expect(subject).to redirect_to(user_url(assigns(:user)))
  #   end

  #   it "redirects_to :action => :show" do
  #     expect(subject).to redirect_to :action => :show,
  #                                    :id => assigns(:user).id
  #   end

  #   it "redirects_to(@user)" do
  #     expect(subject).to redirect_to(assigns(:user))
  #   end

  #   it "redirects_to /users/:id" do
  #     expect(subject).to redirect_to("/users/#{assigns(:user).id}")
  #   end
  # end
  
 # describe "#new" do
 #    render_views
 #    it "re-renders the new method" do
 #      get :new 
 #      expect(response).to render_template("new")
 #    end
   
 #   end
 #  describe "#update" do
 #    render_views
 #    before(:each) do
 #      @user.save
 #      patch :update, {  id: @user.id,
 #            user: { email:"a_a@a.com",admin:false,password:"123456789",password_confirmation:"123456789",userName:"username"} }
 #      end
 #      it "renders the json representation for the updated user" do
 #        expect(assigns[:user].email).to eql "a_a@a.com"
 #      end

 #      it "renders the json representation for the updated user" do
 #        expect(assigns[:user].admin).to eql false
 #      end

 #      it "renders the json representation for the updated user" do
 #        expect(assigns[:user].userName).to eql "username"
 #      end
 #  end




end