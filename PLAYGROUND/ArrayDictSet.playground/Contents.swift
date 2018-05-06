// ARRAYS & DICTIONARIES

// update: 03.09.16; 16:00

import Cocoa

/* ARRAYS: Zusammenfassung mehrerer Variablen in einer Struktur
- alle Variablen müssen vom selben Typ sein / Ausnahme: AnyObject
- Zugriff auf Variablen über Indexnummer
- Indizierung der Felder beginnt mit der Ziffer 0. */

var toDoListe = ["Login", "Version"]
toDoListe += ["Tests", "Refactoring"]
toDoListe.count
toDoListe.insert("upload", atIndex:0)   // nachfolgende Elemente werden um eine Position verschoben
toDoListe.removeAtIndex(0)
toDoListe.append("upload")              // mit "append" kann nur ein Wert am Ende angehängt werden

for toDoItem in toDoListe {             // mittels For-Schleife, die Liste durchgehen
    NSLog("toDoItem: \(toDoItem)")
}


var Spieler: [String] = ["Max", "Paul", "Benjamin", "Dominik"]
var Zahlen: [Int] = [1,2,3,4,5]

var out1 = Spieler[0]
var out2 = Zahlen[2]
let firstPlayer = Spieler.first
let lastPlayer = Spieler.last


var array = Array(count: 3, repeatedValue: "A")
let count = array.count
array.removeLast()
array.append("B")
array.insert("C", atIndex: 2)


var city1 = "HEF"; let city2 = "BN"
// Ein Array aus vordefinierten Werten, einer Variablen und einer Konstanten:
var cities = ["B","DO","F","M","KS", city1,city2]
cities.count
cities[2...3] = ["VB"]      // Zwei Elemente im Array durch ein neues Element ersetzen
cities
cities.count
cities[1] = "FB"            // Durch Zuweisung ein Element an definierter Stelle ersetzen
cities


/* Wird ein Array als Variable mit "var" deklariert, können der Auflistung 
nach der ersten Initialisierng zusätzliche Werte angehängt werden.
Ist das Array eine Konstante sind die Elemente und deren Anzahl unveränderlich.
Genau wie einzelne Variablen und Konstanten sind Arrays typsicher.
Eine Ausnahme ist die explizite Deklaration eines Arrays mit dem Typ AnyObject.*/


// Bsp. für ein zweidimensionales Array:
var zweiDimArray: [[Int]] = [[1,2,3], [4,5,6,]]
print(String("Anzahl ="+String(zweiDimArray.count)))


var numbers = [Int]()            // Angabe des Datentyps bei leerem Array in diesem Fall Pflicht!
numbers.append(1)
numbers.append(2)
var moreNumbers = [Int](numbers)
moreNumbers.append(3)            // Erstellt ein neues Array auf der Basis eines existierenden Arrays
moreNumbers += [4, 5, 6]



/* Mit der Methode "sort" können Listen sortiert werden.
Als Parameter erwartet die Methode eine Funktion, mit der 
jeweils zwei Elemente miteinander verglichen werden sollen.
Hierfür können die Platzhalter $0 und $1 bereitgestellt werden.
"caseInsensitiveCompare" ignoriert Groß- und Kleinschreibung.
"OrderedAscending" bzw "OrderedDescending" sortiert alphabetisch
in aufsteigender bzw. absteigender Reihenfolge. */

cities.sortInPlace ({$0.caseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending })
print(cities)

/* Eine Alternative zu "sort" ist die Methode "sorted".
Sie sortiert nicht das angegebene Array, 
sondern generiert ein neues sortiertes Array.
Die ursprüngliche Auflistung bleibt unverändert. */

var sortedCities = cities.sort ({$0.caseInsensitiveCompare($1) == NSComparisonResult.OrderedAscending })
// die sorted-Methode benötigt im Allgemeinen weniger Vergleiche!
print(sortedCities)

// Städte, deren Namen mit einem N endet:
var filteredCities = cities.filter(
    { $0.characters.last == "N"
})
print(filteredCities)

// Element "BN" gezielt aus dem Array mittels "filter" und "!=" entfernen:
cities = cities.filter({ $0 != "BN" })
print(cities)

// Das Objekt an Position 1 aus dem Array entfernen
cities.removeAtIndex(1)
// Das letzte Objekt aus dem Array entfernen
cities.removeLast()
// Das Array komplett leeren
cities.removeAll()

// Int-Typen mit Platzhalter und dem Operator "<" sortieren:
var numbersArray:[Int] = [77,4,7,1,100,56,23,89,48]
numbersArray.sortInPlace ({$0 < $1})
print(numbersArray)

/* Aus dem "numbersArray" werden alle Zahlen > 50 herausgefiltert.
Per Closure wird der Methode die entsprechende Bedingung übergeben.*/
var filteredNumbers = numbersArray.filter({ $0 > 50})
print(filteredNumbers)



// DICTIONARY : Alternative zum ARRAY

var spielerliste: Dictionary<Int, String> = [1: "Spieler A", 2: "Spieler B", 3: "Spieler C"]

/* Nach der Bezeichnung folgt das Schlüsselwort "Dictionary".
Neben dem eigentlichen Wert wird immer ein Schlüssel gespeichert,
über den das gespeicherte Element ausgelesen werden kann.
Die englische Fachliteratur verwendet die Bezeichung "Key-Value-Pair".
In spitzen Klammern wird zuerst der KeyType und dann der ValueType festgelegt.
In eckigen Klammern wird dann ebenfalls zunächst der Schlüsselwert 
gefolgt von einem Doppelpunkt und dem Speicherwert angegeben.

Auch hier werden wie beim Array Werte desselben Typs gespeichert.
Hier liegen die Elemente allerdings nicht einer bestimmmten Reihenfolge vor 
und werden auch nicht über die Indexposition angesprochen.

Dictionaries eignen sich, um in einer großen Menge von Elementen
schnell einen einzelnen Eintrag zu finden.
Hierbei wird jedes Element über einen eindeutigen Schlüssel identifiziert.

Mit Arrays wäre die Suche nach einem Eintrag umständlich.
Nacheinander müssten sämtliche Elemente geprüft werden.
Abhängig vom Umfang der Daten kann die Suche sehr lange dauern.
Dictionaries sind hingegen für einen schnellen Zugriff optimiert 
und liefern bei richtigem Schlüssel umgehend ein Ergebnis.
Zur Laufzeit einer Anwendung bleiben die Elemente in einem Dictionary nicht 
zwangsläufig in der initialen Reihenfolge.
Dem System steht es frei, die Wertepaare neu anzuordnen, 
um einen optimierten Zugriff zu gewärleisten.
Aus diesem Grund gibt es hier auch keine Sortier-Methoden.*/

var dictNurDeklariert: [Int: String]
var dictLeer = [Int: String]()

var produkte = [1001: "Apfel", 1002: "Birne", 1003: "Banane"]
let stringIntDict = ["Apfel": 1001, "Birne": 1002, "Banane": 1003]

// Zugriff:
produkte[1001]
stringIntDict["Apfel"]

// Einfügen:
produkte[1004] = "Erdbeere"
produkte.count

// Entfernen:
produkte[1001] = nil
produkte

// Dictionary leeren:
produkte = [:]
produkte.isEmpty


var personen = [25:"Anna", 33:"Katrin", 52:"Brigitte"]
var annotatedDict: [Int: String]
var emptyDict = [Int: String]()
emptyDict.isEmpty
personen.count
personen[25] = "Sabine"                                     // Ersetzt Anna durch Sabine

/* updateValue übernimmt in Swift zwei Aufgaben:
Ist der übergebene Schlüssel im Dictionary nicht bekannt,
wird der Liste ein zusätzliches Wertepaar hinzugefügt.
Existiert der Schlüssel, wird der hinterlegte Wert ersetzt.
Diese Methode bietet den Vorteil, dass der alte Wert, 
der überschrieben wird, zuvor ausgelesen werden kann*/
personen.updateValue("Anna", forKey: 25)
personen[25]

/* Möchte man auf ein Element aus dem Dictionary zugreifen,
benötigt man nicht die Position, sondern den zugehörigen Schlüssel.
Der Rückgabewert eines Zugriffs ist immer ein Optional. 
Gibt es den Schlüssel nicht, erhält man ein nil.*/
personen[27]
personen[55] = "Hubert"                                     // Erweitert das Dictionary um Hubert
personen.count

for persNr in personen.keys { "PersNr: \(persNr)"}          // Ausgabe der Schlüssel

for name in personen.values {"Name: \(name)"}               // Ausgabe der Werte

for (persNr, name) in personen {"\(persNr): \(name)"}       // Ausgabe der Wertepaare

var size = personen.count                                   // Die Anzahl der Wertepaare ermitteln

personen.removeValueForKey(55)                              // "removeValueForKey" entfernt Einträge
personen[55]

personen.removeAll()                                        // "removeAll" leert das Dictionary

/* "updateValue", "removeValue" und "removeAll"
funktionieren nur mit der Deklaration "var".
Als Konstanten sind Dictionaries unveränderlich. */


/* Deklarationen leerer Dictionaries sind umfangreicher
als bei Arrays, denn die Datentypen müssen für
den Schlüssel und den Wert angegeben werden: */
var stringDict = Dictionary<Int, String>()
stringDict.updateValue("Hallo Swift", forKey: 1)
var s = stringDict[1]

var doubleDict = Dictionary<String, Double>()
doubleDict.updateValue(3.14156, forKey: "Pi")
var d = doubleDict["Pi"]


/* Durch die Deklaration mit AnyObject akzeptiert 
ein Dictionary Elemente mit unterschiedlichen Wertetypen.
Der Schlüssel muss jedoch immer genau einem Typ entsprechen. */
var anyDict = Dictionary<String, AnyObject>()
anyDict.updateValue(300.00, forKey: "K1")
anyDict.updateValue("Hallo Swift", forKey: "K2")
anyDict.updateValue(1, forKey: "K3")
print(anyDict["K1"])
print(anyDict["K2"])
print(anyDict["K3"])



// Weitere Beispiele:
var cities2 = ["Berlin", "Prag", "Wien", "Zürich"]
var colors = ["Blau", "Gelb", "Grün", "Schwarz"]
var mainDict = ["cities":cities, "colors":colors]

var firstCity = mainDict["cities"]!.first
var firstColor = mainDict["colors"]!.first

var anotherDict = [String: [String]]()
anotherDict["cities"] = cities2
anotherDict["colors"] = colors

var lastCity = anotherDict["cities"]!.last
var lastColor = anotherDict["colors"]!.last

var moreCities = ["K":"Köln", "L":"London", "R":"Rom", "P":"Paris"]
var moreColors = ["R":"Rot", "O":"Orange", "G":"Grau", "M":"Magenta"]

var dataArray = [[String:String]]()
dataArray.append(moreCities)
dataArray.append(moreColors)

var london = dataArray.first!["L"]
var magenta = dataArray.last!["M"]



// SETS: unsortierte Mengen

var nurDeklariert: Set<Double>

var lottozahlen = Set<Int>()
lottozahlen.insert(6)
lottozahlen.insert(15)

var meineNamen: Set = ["Jan", "Peter", "Thomas"]
meineNamen.count
meineNamen.contains("Jan")
meineNamen.contains("Stefan")
meineNamen.remove("Peter")

// Vereinigungsmenge: union
let mengeA: Set = [1,2,3,4,5]
let mengeB: Set = [6,7,8,9,10]
mengeA.union(mengeB).sort()

// Schnittmenge: intersection / intersect
let mengeC: Set = [1,2,3,4,5]
let mengeD: Set = [2,3,4,5,6]
mengeC.intersect(mengeD).sort()
