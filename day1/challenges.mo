actor coding_challenge_day1 {

    public func multiply(n : Nat, m : Nat ) : async Nat {
        return n * m;
    };

    public func volume( n : Nat ) : async Nat {
        return n ** 3;
    };

    let minutes_per_hour : Nat = 60;

    public func hours_to_minutes( n : Nat ) : async Nat {
        return n * minutes_per_hour;
    };

    var counter : Nat = 0;

    public func set_counter( n : Nat ) : async (){
        counter := n;
        return;
    };

    public query func get_counter() : async Nat {
        return counter;
    };

    public func test_divide( n: Nat, m : Nat ) : async Bool {
        if ( n % m == 0 ) 
            { return true; }
        else   
            { return false; }
    };

    public func is_even( n : Nat ) : async Bool {
        return n % 2 == 0;
    };
};
