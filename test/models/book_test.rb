# test/models/book_test.rb
require "test_helper"

describe Book do
  let(:book) { Book.new }

  it "must have a title to be valid" do
    author = Author.new name: "F. Scott Fitz"
    author.save
    book.author = author

    book.valid?.must_equal false
    book.title = "The Great Gatsby"
    # puts "-------------"
    # puts book.errors
    # book.errors.each do |column, message |
    #   puts "#{column}: #{message}"
    # end
    # puts "-------------"
    book.valid?.must_equal true, "If given a title the book is valid"

  end
  it "must have an author to be valid" do
    book.title = "The Great Gatsby"

    book.valid?.must_equal false
    book.author = Author.new(name: "F. Scott F.")
    book.valid?.must_equal(true, "Given an author and title it's valid")

    # book.price.must_be :<, 5, "The price must be less than $5"
  end

  it "Must have an author and title" do
    #book.save
    book.valid?

    book.errors.keys.must_include :title
    book.errors[:title].must_equal ["can't be blank"]
    book.errors.keys.must_include :author
    book.errors[:author].must_equal ["must exist"]
  end








end
