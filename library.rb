class Library
  attr_accessor :books

  def initialize file = nil
    self.books = []
    unless file.nil?
      self.books = YAML::load_file file
    end
  end

  def get_books_in_category category
    self.books.select{|b| b.category == category }
  end

  def add_book book
    raise ArgumentError, "Must be a book to be added." unless book.instance_of?(Book)
    self.books.push(book)
  end

  def get_book title
    self.books.select {|b| b.title.downcase == title.downcase }.first
  end
end 
