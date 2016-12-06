require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	#before { @book = FactoryGirl.build(:book) }
  #subject { @book }
before :each do 
  @book = FactoryGirl.build(:book)
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = User.create(email:"a_a@a.com",password:"123456789",password_confirmation:"123456789",userName:"username")
end

  describe "GET index" do
        render_views
    before(:each) do
      @books = 4.times { FactoryGirl.create :book }
      get :index
    end

    it "assigns @books" do
      get :index
      expect(assigns[:books].size).to eq 4
    end

    it "show a list of all books" do 
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end
  describe "GET show" do
    render_views
    before(:each) do
      @book.save
    end
    it "assigns @book" do
      get :show, id:  @book.id
      expect(assigns[:book].title).to eq "b_1"
    end

    # it "show a list of all books" do 
    #   get :index
    #   expect(response).to be_success
    # end

    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end
    
  end


end
