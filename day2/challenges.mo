import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Debug "mo:base/Debug";


actor {

  public func average_array( a : [Int]) : async Int {
    var sum : Int = 0;

    for ( i in a.vals() ){
      sum := sum + i;
    };
    return sum / a.size();
  };


  public func count_character(t : Text, c : Char) : async Nat {
    var count : Nat = 0;

    for ( ch in t.chars()){
      if( ch == c )
        count += 1;
    };
    return count;
  };


  public func factorial(n : Nat) : async Nat {
    var f : Nat = 1;
    if( n == 0 )
      { f := 1; }
    else {
      let f1 = await factorial(n - 1);
      f :=  n * f1;
      };
    return f;
  };


  private func is_separator( c : Char ) : Bool {
    if(( c == ' ' ) or ( c == '\n')) {
      return true;
    };
    return false;
  };

  public func number_of_words(t : Text) : async Nat {
    var wc : Nat = 0;
    var inword : Bool = false;

    for ( c in t.chars()){
      if( not is_separator(c)) {
        if( not inword ) {
          wc += 1;
          inword := true;
        };
      }
      else {
        if( inword ){
          inword := false;
        }
      }
    };
    return wc;
  };


  private func equal( x : Nat, y : Nat ) : Bool {
    return x == y;
  };

  public func find_duplicates(a : [Nat]) : async [Nat] {
    let max : Nat = 100;
    let b = Buffer.Buffer<Nat>(max);
    let d = Buffer.Buffer<Nat>(max);
    let r = Buffer.Buffer<Nat>(max);

    b.clear();
    d.clear();
    r.clear();
    
    for ( i in a.vals()){
      if( Buffer.contains<Nat>(b, i, equal)) {
        if( not Buffer.contains<Nat>(d, i, equal)){
          d.add(i);
        };
      }
      else{
        b.add(i);
      };
//      Debug.print(debug_show(Buffer.toArray(b)));
    };

    for ( i in a.vals()){
      if( Buffer.contains<Nat>(d, i, equal) and ( not Buffer.contains<Nat>(r, i, equal))){
        r.add(i);
      };
    };
    return Buffer.toArray(r);
  };


  private func is_even( n : Nat ) : Bool {
    return n % 2 == 0;
  };

  public func convert_to_binary(n : Nat) : async Text {
    var t : Text = "";
    var v : Nat = n;
    var bit: Char = ' ';

    while( v != 0 ){
      if(is_even(v)){
        bit := '0';
      }
      else {
        bit := '1';

      };
      t := Char.toText(bit) # t;
      v /= 2;
    };
    return t;
  }
}


