require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	#before { @book = FactoryGirl.build(:book) }
  #subject { @book }
before :each do 
  @book = FactoryGirl.build(:book)
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = FactoryGirl.create :user
  sign_in @user
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

  # describe "POST #create" do
  #   before(:each) do
  #     @book_attributes = FactoryGirl.attributes_for :book
  #     post :create, { id: @book.id, book: @book_attributes }
  #   end

  #   it "renders the json representation for the question record just created" do
  #     expect(assigns[:book].title).to eq @book_attributes[:title]
  #   end
  # end

  describe "#create" do
    render_views
    @book_attributes = FactoryGirl.attributes_for :book
    subject { post :create, :book => { title: @book.title, author: @book.author, image: nil,
                                      BookCode: @book.BookCode, popularity: 5, numOfCopies: 50}}

    it "redirects to widget_url(@widget)" do
      expect(subject).to redirect_to(book_url(assigns(:book)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:book).id
    end

    it "redirects_to(@widget)" do
      expect(subject).to redirect_to(assigns(:book))
    end

    it "redirects_to /widgets/:id" do
      expect(subject).to redirect_to("/books/#{assigns(:book).id}")
    end
  end


end
