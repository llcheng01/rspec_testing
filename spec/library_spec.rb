require 'spec_helper'

describe "Library object" do
  before :all do 
    lib_obj = [
      Book.new("Javaiscript: The Good Parts", "Douglas Crockford", :web),
      Book.new("Designing with Web Standards", "Jeffery Zel", :design),
      Book.new("Don't Make me Think", "Steve King", :usability),
      Book.new("Javaiscript Patterns", "Stayon Stefanov", :web)
    ]
    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_obj
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        expect(lib.books.size).to eql 0
      end
    end
    context "with a yaml file parameters" do
      it "has four books" do
        expect(@lib.books.size).to eql 4
      end
    end
  end

  it "returns all the books in a given category" do
    expect(@lib.get_books_in_category(:web).size).to eq 2  
  end

  it "accepts new books" do
    @lib.add_book(Book.new("Designing for the web", "Mark Boulton", :design))
    expect(@lib.get_book("Designing for the web")).to be_an_instance_of(Book)
  end

end
