import List "mo:base/List";
import Array "mo:base/Array";
import Book "book.mo";


actor bookstore {

  public var booklist : [book] = [];

  public func create_booklist() : async ZNat {
     booklist.add (create_book( "title one", 200 ));
     booklist.add(create_book( "title two", 300 ));
     booklist.add(create_book( "title three", 100 ));
  };

  public func add_book( b : book ) : async () {
    Array.append<book>( booklist, [b] );
    null;
  };

  public func get_books() : async [book] {
    var books : [book] = [];

    for( b in booklsit.vals()){
      Array.append( books, [b] );
    return books;
    }
  }

}

