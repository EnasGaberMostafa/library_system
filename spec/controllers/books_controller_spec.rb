require 'rails_helper'

RSpec.describe BooksController, type: :controller do
	#before { @book = FactoryGirl.build(:book) }
  #subject { @book }
before :each do 
  @book = FactoryGirl.build (:book)
  @book = FactoryGirl.create :book
  @request.env["devise.mapping"]= Devise.mappings[:user]
  # @user = User.create(email:"a_a@a.com",admin:true,password:"123456789",password_confirmation:"123456789",userName:"username")
  # sign_in @user
  @user = FactoryGirl.create :user
  sign_in @user
end

  describe "index method test" do
        render_views
    before(:each) do
      @books = 4.times { FactoryGirl.create :book }
      get :index
    end

    it "assigns @books" do
      get :index
      expect(assigns[:books].size).to eq 5
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


  describe "show method test " do
    render_views
    before(:each) do
      @book.save
    end

    it "show title" do
      get :show, id:  @book.id
      expect(assigns[:book].title).to eq "b_1"
    end
    
     it "show author" do
      get :show, id:  @book.id
      expect(assigns[:book].author).to eq "a_1"
    end

      it "show number of copies" do
      get :show, id:  @book.id
      expect(assigns[:book].numOfCopies).to eq 50
    end

      it "show book code" do
      get :show, id:  @book.id
      expect(assigns[:book].BookCode).to eq "12345678910"
    end 
    
  end

  describe "update method test" do
    render_views
    before(:each) do
      @book.save
      patch :update, {  id: @book.id,
            book: { title: "new_title", author: "new_author", image: nil,
                                  BookCode: @book.BookCode, popularity: 5, numOfCopies: 60} }
      end
      it "update book title" do
        expect(assigns[:book].title).to eql "new_title"
      end

      it "update book author" do
        expect(assigns[:book].author).to eql "new_author"
      end

      it "update book nymber of copies" do
        expect(assigns[:book].numOfCopies).to eql 60
      end
  end

  describe "create method test" do
    render_views
    @book_attributes = FactoryGirl.attributes_for :book
    subject { post :create, :book => { title: @book.title, author: @book.author, image: nil,
                                      BookCode: @book.BookCode, popularity: 5, numOfCopies: 50}}

    it "redirects to book_url(@book)" do
      expect(subject).to redirect_to(book_url(assigns(:book)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:book).id
    end

    it "redirects_to(@book)" do
      expect(subject).to redirect_to(assigns(:book))
    end

    it "redirects_to /books/:id" do
      expect(subject).to redirect_to("/books/#{assigns(:book).id}")
    end
  end
  
   describe "new method test" do
    render_views
    it "re-renders the new method" do
      get :new 
      expect(response).to render_template("new")
    end
   
  end


  describe "create method test2" do
    before(:each) do
      @book_attributes = FactoryGirl.attributes_for :book
      post :create, { id: @book.id, book: @book_attributes }
    end

    it "create title properly" do
      expect(assigns[:book].title).to eq @book_attributes[:title]
    end

    it "create author properly" do
      expect(assigns[:book].author).to eq @book_attributes[:author]
    end

    it "create book code properly" do
      expect(assigns[:book].BookCode).to eq @book_attributes[:BookCode]
    end

    it "create number of copies properly" do
      expect(assigns[:book].numOfCopies).to eq @book_attributes[:numOfCopies]
    end
  end

  describe 'destroy method test' do
    context "success" do
      it "deletes the book" do
      expect{ 
        delete :destroy, {  id: @book.id,
            book: { title: @book.title, author: @book.author, image: nil,
                                  BookCode: @book.BookCode, popularity: @book.popularity, numOfCopies: @book.numOfCopies} }
     }.to change(Book, :count).by(-1)
      end

    end
  end


end
