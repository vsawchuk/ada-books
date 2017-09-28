class BooksController < ApplicationController

  # BOOKS = [{id: 1, title: "Object Oriented Design in Ruby", author: "Sandy Metz"},
  #   {id: 2, title: "Harry Potter and the Goblet of Fire", author: "JK Rowling"},
  #   {id: 3, title: "The Girl with the Dragon Tatoo", author: "Stieg Larsson"}]

  def index
    # .all would also work, just unsorted
    @books  = Book.order(:title)
  end

  def show

    @book = Book.find( params[:id].to_i )

    # id = params[:id].to_i
    # @book = nil
    # BOOKS.each do |book|
    #   if book[:id] == id
    #     @book = book
    #   end
    # end
  end

  def edit
    @book = Book.find_by(id: params[:id].to_i)

    unless @book
      redirect_to root_path
    end
  end



  def new
    @book = Book.new
  end

  def create
  end

  def destroy
  end

  def update
    book = Book.find_by(id: params[:id].to_i)
    redirect_to books_path unless book

    if book.update_attributes book_params
      redirect_to books_path
    else
      render :edit
    end
  end
  private
    def book_params
      return params.require(:book).permit(:title, :author, :description, :price)
    end






end
