class BorrowedBooksController < ApplicationController
  before_action :set_borrowed_book, only: [:show, :edit, :update, :destroy]
  before_filter :set_borrowed_book , only: [:show, :edit, :update, :destroy]
  # GET /borrowed_books
  # GET /borrowed_books.json
  def index
    @borrowed_books = BorrowedBook.all
  end

  # GET /borrowed_books/1
  # GET /borrowed_books/1.json
  def show
  end
  
  # GET /borrowed_books/new
  def new
    @borrowed_book = BorrowedBook.new
   
  end

  # GET /borrowed_books/1/edit
  def edit  
  end

  # POST /borrowed_books
  # POST /borrowed_books.json
  def create
    @borrowed_book = BorrowedBook.new(borrowed_book_params)
    respond_to do |format|
      if @borrowed_book.save
        borrow(@borrowed_book)
        format.html { redirect_to @borrowed_book, notice: 'Borrowed book was successfully created.' }
        format.json { render :show, status: :created, location: @borrowed_book }
      else
        format.html { render :new }
        format.json { render json: @borrowed_book.errors, status: :unprocessable_entity }
      end
    end
  end
  def borrow borrowed_book
    puts "///////////////////borrowingggggggggggggggg"

    @book=Book.where(id: borrowed_book.bookId).take
    puts @book.numOfCopies
    @book.numOfCopies=@book.numOfCopies-1
    @book.popularity=@book.popularity+1
    puts @book.numOfCopies
    @book.save
  end

 def returnBook borrowed_book
    @book=Book.where(id: borrowed_book.bookId).take
    @user=User.where(id: borrowed_book.userId).take
        puts @book.numOfCopies
        @book.numOfCopies=@book.numOfCopies+1
        puts @book.numOfCopies
        @book.save
        borrowed_book.destroy

    if @user!=nil && borrowed_book.returnDate > borrowed_book.dueDate
          puts "userrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
          puts @user.penalty
          @user.penalty=@user.penalty+1
          @user.save
          puts @user.errors.full_messages
       if @user.penalty > 3 
            count = BorrowedBook.find_by_sql("SELECT * FROM borrowed_books where userId = '#{@user.id}'").count   
            puts count              
            if count==0
              @user.destroy
              redirect_to users_url, notice: 'User was destroyed because of penalty.'
            end
       end    
  end
end
  # PATCH/PUT /borrowed_books/1
  # PATCH/PUT /borrowed_books/1.json

  def update
    respond_to do |format|
      if @borrowed_book.update(borrowed_book_params)
        returnBook (@borrowed_book)
        format.html { redirect_to @borrowed_book, notice: 'Borrowed book was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrowed_book }
      else
        format.html { render :edit }
        format.json { render json: @borrowed_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowed_books/1
  # DELETE /borrowed_books/1.json
  def destroy
    @borrowed_book.destroy
    respond_to do |format|
      format.html { redirect_to borrowed_books_url, notice: 'Borrowed book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrowed_book
      @borrowed_book = BorrowedBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def borrowed_book_params
      params.require(:borrowed_book).permit(:userId, :bookId, :borrowDate, :dueDate, :returnDate)
    end
end
