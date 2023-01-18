type book = record{
  title: Text,
  pages: Nat
}


module Book {

  public func create_book( t : Text, n : Nat) : async book {
    return {
      "title" : t,
      "pages" : n
     }
  }

}
