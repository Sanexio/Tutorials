// update: 17.07.2016

// Generics

import UIKit


func maximumInt(x: Int, y: Int) -> Int {
    if x <= y {
        return x
    }
    return y
}


func maximumDouble(x: Double, y: Double) -> Double {
    if x <= y {
        return x
    }
    return y
}



// Generic - wird eingesetzt um duplizierten Code zu reduzieren:

func maximalWert<T: Comparable>(x: T, y: T) -> T {
    if x <= y {
        return x
    }
    return y
}

