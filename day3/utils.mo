import Option "mo:base/Option";
import Debug "mo:base/Debug";
import Buffer "mo:base/Buffer";
import List "mo:base/List";

actor challenges {

  public func second_maximum(array : [Int]) : async Int {
    var max : ?Int = null;
    var max2 : ?Int = null;

    for( e in array.vals()){
      if( max == null ){
        max := ?e;
      }
      else {
        if ( max2 == null ){
          if( Option.get(max,0)  > e ){
            max2 := ?e;
          }
          else {
            max2 := max;
            max := ?e;
          }
        }
        else {
          if( e > Option.get(max, 0) ){
            max2 := max;
            max := ?e;
          }
          else {
            if( e > Option.get(max2, 0 )){
              max2 := ?e;
            }
          }
        }
      }
    };
    return Option.get(max2, -9999);
  };


  public func remove_even(array : [Nat]) : async [Nat]  {
    let buf = Buffer.Buffer<Nat>(100);

    buf.clear();

    for( e in array.vals()){
      if( e % 2 != 0 ){
        buf.add( e );
      }
    };
    return Buffer.toArray(buf);
  };

  public func drop<T>(xs : [T], n : Nat) : async [T] {
    let l : List.List<T> = List.fromArray(xs);
    
    return List.toArray<T>(List.drop<T>(l, n));
  }
}
