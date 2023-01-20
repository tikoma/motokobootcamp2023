import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Principal "mo:base/Principal";



actor challenges {

  func unique<T>(l : List.List<T>) : List.List<T> {
    var a : List.List<T> = null;

    for( e : T in List.toIter<T>(l)){
      if( not List.some<T>( a, func(x : T) { equal<T>(x, e })){
        a := List.push<T>(e, a);
      }
    };
    return a;
  };

  public func nat_unique(l : List.List<Nat>) :  async List.List<Nat>{
    unique<Nat>(l);
  };

  func rev1<T>( l : List.List<T>, r : List.List<T> ) : List.List<T> {

    let (h, t) = List.pop<T>(l);

    switch (h){
    case null { return r; };
    case (?something)  {
              let temp = List.append<T>(List.make<T>(something : T), r);
              return rev1(t, temp );
         }
    }
  };

  func reverse<T>(l : List.List<T>) : List.List<T> {
    rev1( l, null); 
  };

  public func nat_reverse( l : List.List<Nat>) : async List.List<Nat> {
    reverse<Nat>(l);
  };


  public shared ({ caller }) func is_anynomous() : async Bool { 
    let anonymous_principal: Text = "2vxsx-fae";
    return (Principal.toText(caller) == anonymous_principal);
  };


  func find_in_buffer<T>(buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
    var index : Nat = 0;

    for( e in buf.vals()){
      if( equal( buf.get(index), val )){
        return index;
      }
      else {
        index += 1;
      };
    return null;
    }
  };

  public func text_find_in_buffer(buf : Buffer.Buffer<Text>) : async ?Nat {
    return find_in_buffer<Text>( buf, func f(x : Text, y : Text) : Bool  { return( x == y )});
  }
}
