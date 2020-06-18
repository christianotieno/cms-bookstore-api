# frozen_string_literal: true

class BooksController < ApplicationController

  def index
    @books = Book.all
    render json: {
      status: 'Success',
      data: @books
    }, status: :ok
  end

  def show
    @book = Book.find(params[:id])
    render json: {
      status: 'Success',
      data: @book
    }, status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: {
        status: 'Success',
        message: 'Book created',
        data: @book
      }, status: :ok
    else
      render json: {
        status: 'Error',
        message: 'Error creating book',
        data: @book.errors
      }, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy


    render json: {
      status: 'Success',
      message: 'Book deleted',
      data: @book
    }, status: :ok
  end

  private

  def book_params
    params.permit(:title, :category)
  end
end
