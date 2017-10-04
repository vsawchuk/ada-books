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
    @book = Book.find_by(id: params[:id])

    unless @book
      redirect_to root_path
    end
  end

  def update
    @book = Book.find_by(id: params[:id])
    redirect_to books_path unless @book

    if @book.update_attributes book_params
      redirect_to books_path
    else
      render :edit
    end
  end



  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Book.find_by(id: params[:id]).destroy

    redirect_to root_path
  end

  private

    def book_params
      return params.require(:book).permit(:title, :author_id, :description, :price)
    end

end
