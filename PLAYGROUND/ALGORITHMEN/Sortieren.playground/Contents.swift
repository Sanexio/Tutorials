// update: 17.07.16, 20:00

import UIKit

let unSortArray = ["z", "k", "u", "a", "u", "ab", "xt4" ]
var sortArray1 = unSortArray.sort()                              // aufsteigend sortieren


// Lsg. eines Sortieralgorithmus m.H. einer Fkt.:

func rückwärts(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var sortArray2 = unSortArray.sort(rückwärts)                    // absteigend sortieren



// Lsg. eines Sortieralgorithmus m.H. einer Closure:

var sortiert = unSortArray.sort(
    { (s1: String, s2: String) -> Bool in
        return s1 > s2
    })
var sortArray3 = sortiert                                       // als Closure absteigend sortieren


var numbersArray:[Int] = [77,4,7,1,100,56,23,89,48]
numbersArray.sortInPlace ({$0 < $1})
print(numbersArray)



// Lsg. eines Sortieralgorithmus m.H. einer Fkt.:

var filteredNumbers = numbersArray.filter({ $0 > 50})
print(filteredNumbers)

let numbersX = [5, 3, 6, 4, 1, 8]
func sortieren(a: Int, b: Int) -> Bool {
    return a < b
}
numbersX.sort(sortieren)
numbersX.sort(<)
numbersX.sort(>)



// Lsg. eines Sortieralgorithmus m.H. einer Closure:

numbersX.sort({ (a: Int, b: Int) -> Bool in
    return a < b
})

// type inference:
let sorted1 = numbersX.sort({ (a, b) -> Bool in
    return a < b
})

// single expression closure:
let sorted2 = numbersX.sort({ (a,b) in a < b })
sorted2

// shorthand argument names:
let sorted3 = numbersX.sort({ $0 < $1})
sorted3

// operator functions:
let sorted4 = numbersX.sort(<)







