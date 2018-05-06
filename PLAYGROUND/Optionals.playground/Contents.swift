// update: 05.08.16, 11:00

import UIKit

// Forced unwrapping:
var fehlerCode: Int?
fehlerCode = 404
print(fehlerCode)

if fehlerCode != nil {
    print(fehlerCode!)
}



// Implicit unwrapping:
var fehlerMeldung: String!
fehlerMeldung = nil

if fehlerMeldung != nil {
    print(fehlerMeldung)
}



// Guard:
func addieren(x: Int?, y: Int?) -> Int? {
    guard let x = x else {
        print("x ist nil")
        return nil
    }
    guard let y = y else {
        print("y ist nil")
        return nil
    }
    
    return x + y
}



// If let:
var alter: Int?
alter = 38

if let meinAlter = alter {
    print(meinAlter)
}



// Nil-Coalescing:
let regular = 90
let overtime = true

var sum: Int
if overtime {
    sum = regular + 30
} else {
    sum = regular
}
var shortSum = regular + (overtime ? 30 : 0)


// lässt sich auch auf Optionals übertragen:
let defaultBackground = "schwarz"
var userBackground: String?
userBackground = "rot"

var bgColor: String
if userBackground != nil {
    bgColor = userBackground!
} else {
    bgColor = defaultBackground
}
var shortBgColor = (userBackground != nil) ? userBackground! : defaultBackground
var coalescingColor = userBackground ?? defaultBackground

