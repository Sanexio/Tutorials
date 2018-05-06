// update: 10.07.2016, 18:30

// Extensions:

import UIKit
import Foundation

/* In Swift können Klassen nicht nur durch Vererbung erweitert werden. Es gibt auch noch die Möglichkeit,
eine Klasse um Funktionen zu erweitern, ohne dass man auf vererbte Elemente setzen muss.

Der Datentyp Double soll um eine Umrechnungsfunnktion erweitert werden.
Da wir keinen direkten Zugriff auf diesen Datentyp haben, behelfen wir uns mit Extensions: */

extension Double {
    var eur: Double {return self / 1.12}
}
let euroBetrag = 97.eur


// Eine Struktur um eine weitere Methode erweitern:
struct Einuser {
    var username = "123"
}
extension Einuser {
    func usernameLength() -> Int {
        return username.utf16.count
    }
}



// SUBSCRIPTS:

// - ermöglichen den Zugriff auf Elemente der Instanz einer Klasse direkt durch Angabe eines Index:

class Zahlen {
    var zahlenreihe = [10, 20, 30, 40, 50]

    subscript(index: Int) -> Int {
        get {
            return zahlenreihe[index]
        }
        set(newValue) {
            zahlenreihe.append(newValue)
        }
    }
}
var zahlen = Zahlen()
print(zahlen[2])

zahlen[0] = 11
print(zahlen[0])                                                // TODO: Hierfür ne for-Schleife programmieren
print(zahlen[1])
print(zahlen[2])
print(zahlen[3])
print(zahlen[4])
print(zahlen[5])



// NESTED TYPES (verschachtelte Typen):

// Klassen, Stukturen und Enumerationen können auch in einen Typ (bspw. einer Klasse) eingebettet werden.
// Diese Vorgehensweise bietet sich immer dann an, wenn ein bestimmter Typ zur Initialisierung eines Elements benötigt wird:

class Auto {
    var karosserie: Karosserie      // Deklaration
    var farbe: Farbe
    
    enum Karosserie {
        case Kompaktwagen, Kombi, Coupe, Cabrio
    }
    
    enum Farbe {
        case blau, grün, gelb, rot
    }
    
    init(karosserie: Karosserie, farbe: Farbe) {
        self.karosserie = karosserie
        self.farbe = farbe
    }
}
var auto = Auto(karosserie: Auto.Karosserie.Kombi, farbe: Auto.Farbe.blau)
// Erzeugung des Objekts außerhalb der Klasse geschieht über den Namen der Klasse!



// EXTENSIONS (Erweiterungen):

// Mit einer Erweiterung kann ein Typ bspw. um eine Eigenschaft (aber nur um eine berechnete),
// eine Methode oder auch um neue Initialisierer erweitert werden.
// Das Überschreiben von vorhandenen Elementen ist allerdings nicht möglich.

/* Allgemeine Syntax:
 extension Auto {
    NEUE FUNKTIONEN
 } */

// Eine Erweiterung mit Schnittstellen ist ebenfalls möglich:
/* extension Auto: Protokoll1, Protokoll2 {
 NEUE FUNKTIONEN
 } */

class Fahrzeug {
    var karosserie: Karosserie
    var farbe: Farbe
    
    enum Karosserie {
        case Kompaktwagen, Kombi, Coupe, Cabrio
    }
    
    enum Farbe {
        case blau, grün, gelb, rot
    }
    
    init(karosserie: Karosserie, farbe: Farbe) {
        self.karosserie = karosserie
        self.farbe = farbe
    }
}
// Der Code für die Erweiterung wird direkt nach der Klasse implementiert und wird nicht innerhalb der Klasse realisiert!
// Dies ist wichtig, da ja auch Typen erweitert werden können, zu denen der Quellcode nicht vorliegt.
    extension Fahrzeug {
        func CalcReichweite(kilometer:Double, liter:Double) -> Double {
            var result:Double=0.0
            result = kilometer / liter
            return result
        }
    }

var fahrzeug = Fahrzeug(karosserie: Fahrzeug.Karosserie.Coupe, farbe: Fahrzeug.Farbe.blau)
print(fahrzeug.CalcReichweite(500, liter: 50))



// Protocoll Extension:

protocol Fruit {
    func fruitColor()->String
}
extension Fruit {
    var weight:Int {
        get {
            return self.weight
        }
        set {
            self.weight = newValue
        }
    }
}
class Apple: Fruit {
    func fruitColor() -> String {
        return "green"
    }
}
class Orange: Fruit {
    func fruitColor() -> String {
        return "orange"
    }
}
class Banana: Fruit {
    func fruitColor() -> String {
        return "yellow"
    }
}
let apple = Apple()
apple.fruitColor()

let orange = Orange()
orange.fruitColor()

var banana = Banana()
banana.fruitColor()
// banana.weight = 10                                           // ToDo: Warum Fehler?



