require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	#before { @book = FactoryGirl.build(:book) }
  #subject { @book }
before :each do 
  @book = FactoryGirl.build (:book)
  @request.env["devise.mapping"]= Devise.mappings[:user]
  @user = User.create(email:"a_a@a.com",admin:true,password:"123456789",password_confirmation:"123456789",userName:"username")
  sign_in @user

end

  # describe "GET index" do
  #       render_views
  #   before(:each) do
  #     @books = 4.times { FactoryGirl.create :book }
  #     get :index
  #   end

  #   it "assigns @books" do
  #     get :index
  #     expect(assigns[:books].size).to eq 4
  #   end

  #   it "show a list of all books" do 
  #     get :index
  #     expect(response).to be_success
  #   end

  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end

  # end


  # describe "GET show" do
  #   render_views
  #   before(:each) do
  #     @book.save
  #   end

  #   it "renders the #show view" do
  #     get :show, id: @book.id
  #     response.should render_template :show
  #   end

  #   it "show title" do
  #     get :show, id:  @book.id
  #     expect(assigns[:book].title).to eq "b_1"
  #   end
    
  #    it "show author" do
  #     get :show, id:  @book.id
  #     expect(assigns[:book].author).to eq "a_1"
  #   end

  #     it "show number of copies" do
  #     get :show, id:  @book.id
  #     expect(assigns[:book].numOfCopies).to eq 50
  #   end

  #     it "show book code" do
  #     get :show, id:  @book.id
  #     expect(assigns[:book].BookCode).to eq "12345678910"
  #   end 
    
  # end


  #  describe "#create" do
  #   render_views
  #   @book_attributes = FactoryGirl.attributes_for :book
  #   subject { post :create, :book => { title: @book.title, author: @book.author, image: nil,
  #                                     BookCode: @book.BookCode, popularity: 5, numOfCopies: 50}}

  #   it "redirects to book_url(@widget)" do
  #     expect(subject).to redirect_to(book_url(assigns(:book)))
  #   end

  #   it "redirects_to :action => :show" do
  #     expect(subject).to redirect_to :action => :show,
  #                                    :id => assigns(:book).id
  #   end

  #   it "redirects_to(@book)" do
  #     expect(subject).to redirect_to(assigns(:book))
  #   end

  #   it "redirects_to /books/:id" do
  #     expect(subject).to redirect_to("/books/#{assigns(:book).id}")
  #   end
  # end
  
  #  describe "#new" do
  #   render_views
  #   it "re-renders the new method" do
  #     get :new 
  #     expect(response).to render_template("new")
  #   end
   
  # end
  # describe "#update" do
  #   render_views
  #   before(:each) do
  #     @book.save
  #     patch :update, {  id: @book.id,
  #           book: { title: "new_title", author: "new_author", image: nil,
  #                                 BookCode: @book.BookCode, popularity: 5, numOfCopies: 60} }
  #     end
  #     it "renders the json representation for the updated user" do
  #       expect(assigns[:book].title).to eql "new_title"
  #     end

  #     it "renders the json representation for the updated user" do
  #       expect(assigns[:book].author).to eql "new_author"
  #     end

  #     it "renders the json representation for the updated user" do
  #       expect(assigns[:book].numOfCopies).to eql 60
  #     end
  # end


end
