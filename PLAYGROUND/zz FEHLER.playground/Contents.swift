// update: 18.07.2016, 10:00

import UIKit
import Foundation



// Fehler 1:
/*
func fabrik() -> () -> Int {                    // Rückgabewert: Closure
    var artikelNummer = 101
    
    func neuesProdukt() -> Int {
        //Herstellung...
        return artikelNummer += 1
    }
    
    return neuesProdukt
}
var autofabrik = fabrik()
autofabrik()
*/



// Fehler 2 (aus Tutorial: Closures): Es werden nur leere Array-Elemente ausgegeben.

/* Das nächste Beispiel zeigt einen asynchronen Programmablauf.
 Mit der "map"-Methode kann mit geringem Aufwand jedes Element
 aus einem Array angesprochen werden. */

var showFriends =                                                       // Definition eines Closures zu Ausgabe
    {
        (name:String) -> () in
        print("Hallo \(name)!")
}

var friends = ["Mike", "Marika", "Andreas", "Peter", "Sabine"]


friends.map(showFriends)                                                // Alle Array-Elemente ansprechen




// Wenn sechsGewurfelt false ist, dann ist doch !sechsGewürfelt true ???

var sechsGewuerfelt = false

while !sechsGewuerfelt {
    var augenzahl = Int(arc4random_uniform(6)+1)
    
    if augenzahl == 6 {
        sechsGewuerfelt = true
    }
}