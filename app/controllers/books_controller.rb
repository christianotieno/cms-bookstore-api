class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :destory, :create]
  
  def index
    @books = Book.all
    render json: @books
  end
  
  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    @book = Book.new(book_params)
    
    if @movie.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end


  private
  # def set_book
  #   @book = Book.find(params[:id])
  # end

  def book_params
    params.require(:book).permit(:title, :author, :category)
  end
end
