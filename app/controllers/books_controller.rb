class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def create
    @books = Book.all
  	@book_new = Book.new(book_params)
  	@book_new.user = current_user
  	if @book_new.save
  	redirect_to book_path(@book_new.id), notice: "The book was successfully created"
    else
    render :action => "index"
    end
  end

  def edit
    @book_check = Book.find(params[:id])
    if current_user.id == @book_check.user.id
  	 @book = Book.find(params[:id])
    else
      redirect_to books_path
    end
  end

  def show
  	@book =  Book.find(params[:id])
  	@book_new = Book.new
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	redirect_to book_path(@book.id), notice: "The book was successfully updated"
    else
    render :action => "edit"
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
