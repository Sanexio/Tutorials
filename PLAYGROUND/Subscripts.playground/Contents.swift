// update: 10.07.2016, 13:00

//Subscripts verwenden:

import UIKit

struct Spieler {
    var spielernummern: [String: Int]
    
    init() {
        spielernummern = ["Lewandowski": 9,
                          "Ronaldo": 7,
                          "Reus": 11]
    }
    
    subscript(name: String) -> Int? {               // Subcript baut in diesem Bsp. die Zugriffsfunktion eines Dictionary nach
        get {
            return spielernummern[name]
        }
        set (newValue) {
            spielernummern[name] = newValue
        }
    }
}

var dieSpieler = Spieler()
dieSpieler["Reus"]                                  // Aufruf der Get-Methode
dieSpieler["Ronaldo"] = 99                          // Aufruf der Set-Methode
