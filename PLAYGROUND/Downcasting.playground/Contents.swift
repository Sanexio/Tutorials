//update: 10.07.2016, 18:00

import UIKit

// Downcasting von Objekten:

class Mediengerät {
    var lautstärke = 10
    var hersteller = ""
    
    init(hersteller: String) {
        self.hersteller = hersteller
    }
    
    func setVolume(neueLautstärke: Int) {
        self.lautstärke = neueLautstärke
    }
}

class TVGerät: Mediengerät {
    var helligkeit = 15
    
    func neueHelligkeit(neuerWert: Int) {
        self.helligkeit = neuerWert
    }
}

var tv = TVGerät(hersteller: "Sony")
tv.helligkeit

var tvAsMedia = tv as Mediengerät
// nach dem Downcasting kann nicht mehr auf die Eigenschaft "helligkeit" zugegriffen werden.

if tvAsMedia is TVGerät {
    "Ist ein TV"
} else {
    "Ist kein TV"
}



// Der Typ AnyObject

let mehrereObjekte: [AnyObject] = [
    TVGerät(hersteller: "Samsung"),
    TVGerät(hersteller: "Apple")
]

for obj in mehrereObjekte as! [TVGerät] {
    obj.helligkeit
    
}



