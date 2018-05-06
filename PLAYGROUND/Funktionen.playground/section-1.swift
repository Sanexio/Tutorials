// update: 24.07.16; 09:00

import Cocoa
import Foundation

/* Für Codebausteine, die sich bewährt haben,
werden eigene Code-Bibliotheken entwickelt,
mit denen man wiederkehrende Aufgaben erledigen kann.
Ein erster Schritt zur Entwicklung wiederverwendbaren Codes 
ist der Einsatz von Funktionen, wo mehrere Anweisungen zu 
einem Arbeitsschritt zusammengefasst werden.
In Swift werden sämtliche Parameter einer Funktion 
in runden Klammern nach dem Funktionsnamen angegeben.
Andere Programmiersprachen verwenden die Bezeichnung "Argumente".
Der Funktionskopf wird alternativ als "Funktionssignatur" bezeichnet.
 
MERKE: Methoden sind Funktionen, die in einem Objekt definiert werden
 
Unten stehende Fkt. addiert 2 Zahlen und gibt das Ergebnis aus.
Die benötigten Werte werden der Funktion als Parameter übergeben.
Zusammen mit dem Namen der Fkt. werden diese im Funktionskopf deklariert.
Als Parameter erwartet die Fkt. zwei Werte vom Typ Double. */


func addValues(firstValue:Double, secondValue:Double)       // Definition der Funktion addValues
{
    let result = firstValue + secondValue
    print("Das Ergebnis ist \(result).")
}

addValues(23.83, secondValue: 87.12)
addValues(22.88, secondValue: 30.99)
addValues(70.11, secondValue: 20.13)

/* Der Aufruf übergibt die beiden Double-Werte an die Funktion,
die dort als firstValue und secondValue addiert werden.
Der Name des zweiten Parameters muss beim Aufruf mit übergeben werden.
Bei den Parametern einer Fkt. handelt es sich allgemein um Konstanten.
 
Das obige Diagramm zeigt die zeitliche Änderung von "result" an.
Wichtig ist dabei der Umstand, dass bei jedem Funktionsaufruf 
"result" mit einem neuen Wert belegt wird.
Der vorherige Wert von "result" wird verworfen, sobald der
Programmablauf den Gültigkeitsbereich der Funktion verlässt.

Programmieren wir nun eine Fkt., um zwei Int-Typen zu addieren,
kann diese ebenfalls den Namen "adValues" bekommen, da sich
die Signaturen beider Funktionen voneinander unterscheiden.
Bei einem Aufruf der Funktion wird der Compiler automatisch 
die richtige Funktion für die angegebenen Datentypen wählen.
Verwenden mehrere Fkt. im gleichen Gültigkeitsbereich einen 
identischen Namen, aber unterschiedl. Datentypen, 
spricht man von einer Überladung. */

func addValues(firstValue:Int, secondValue:Int)                 // Aufruf der Funktion addValues mit ganzen Zahlen
{
    let result = firstValue + secondValue
    print("Das Ergebnis ist \(result).")
}
addValues(23, secondValue: 87)



/* BENANNTE / EXTERNE PARAMETER:
Hierbei werden zusätzlich zum Namen der Parameter 
und des Datentyps im Funktionskopf Bezeichnungen angegeben.
Hierüber soll eine Funktion gut verständlich und besser lesbar sein.*/

// BSP 1:
func divideValues(dividend firstValue:Double, divisor secondValue:Double)
{
    let result = firstValue / secondValue
    print("Das Ergebnis ist \(result).")
}
divideValues(dividend: 20, divisor: 5)


// BSP 2:
func addieren(x a:Int, y b:Int) {           // vor die internen Parameter der Fkt. werden die externen Parameter gesetzt
    print("\(a) + \(b) = \(a + b)")
}
addieren(x: 5, y: 10)



// FUNKTIONEN MIT RÜCKGABEWERT:

// BSP 1:
func divideValues(Dividend Dividend:Double, Divisor:Double) -> Double       // Rückgabewert nach "->"
{
    let quotient = Dividend / Divisor
    return quotient                                                         // Rückgabewert verlässt Fkt. über "return"
}

let result = divideValues(Dividend: 22.40, Divisor: 2.0)                    // ... Funktion aufrufen, den Rückgabewert entgegennehmen

print("Das Ergebnis ist \(result)")                                         // ... und ausgeben
 

// BSP 2:
func concatStringWithBrackets(firstString:String, secondString:String, thirdString:String) -> String
{ 
 var newString = ""
 if !firstString.isEmpty {                      // falls der n. String nicht leer ist, hänge ihn an newString
    newString += "[\(firstString)]"             // newString enthält nun alle Strings bis zum n. String
    }
 if !secondString.isEmpty {
    newString += "[\(secondString)]"
    }
 if !thirdString.isEmpty {
    newString += "[\(thirdString)]"
    }
 return newString                               // gibt die aneinander gereihten Strings aus
}
concatStringWithBrackets("Hallo ", secondString: "Welt ", thirdString: "!")



/* TUPEL UND ANONYME TYPEN:

Die folgende Funktion soll die Anzahl der Strings in der Zeichenkette bestimmen. 
Die runden Klammern im Funktionskopf und bei der return-Anweisung sind wichtig.
Nur durch sie kann der der Compiler erkennen, dass es sich beim Rückgabewert der Funktion 
um eine Kombination aus mehreren Werten handelt, die Tupel genannt werden.
Einem konkreten Datentypen entspricht dieser Rückgabewert allerdings nicht mehr.
Man bezeichnet den Typ als "Anonymen Typ".
Im aktuellen Beispiel ist er ein Zusammenschluss von einem String und einem Int.
Der Aufruf der Funktion bleibt unverändert, es werden unverändert drei Zeichenketten übergeben.
Ähnlich einem Array kann man über die Indexposition auf die Werte zugreifen.
Dabei muss man jedoch genau darauf achten, wie das Tupel in der Fkt. zusammengesetzt wurde.
Da wir es mit einem anonymen Typ zu tun haben, gibt es keine Vorgaben.*/

func concatStringsWithBrackets (firstString firstString:String, secondString:String, thirdString:String) -> (text:String, counter:Int)
{
    var newString = ""
    var textCounter = 0
    
    if !firstString.isEmpty
    {
        newString += "[\(firstString)]"
        textCounter += 1
    }
    
    if !secondString.isEmpty
    {
        newString += "[\(secondString)]"
        textCounter += 1
    }
    
    if !thirdString.isEmpty
    {
        newString += "[\(thirdString)]"
        textCounter += 1
    }
    
    return (newString, textCounter)
}

let firstConcat = concatStringsWithBrackets(firstString: "Hallo", secondString: "Swift", thirdString: "Entwickler")

print("Neuer Text: \(firstConcat.text)")
print("Verkettete Texte: \(firstConcat.counter)")

let secondConcat = concatStringsWithBrackets(firstString: "Guten", secondString: " Morgen", thirdString: "")

print("Neuer Text: \(secondConcat.text)")
print("Verkettete Texte: \(secondConcat.counter)")



/* EINE UNBESTIMMTE ANZAHL VON PARAMETERN

Eine Möglichkeit mehr Strings zu verarbeiten, 
wäre eine Überladung o.g. Funktion,
die ein Array von Strings entgegennimmt. */

func concatStringsWithBrackets(values:[String]) ->(text:String, counter:Int)
{
    var newString = ""
    var textCounter = 0
    
    for value in values
    {
        if !value.isEmpty
        {
            newString += "[\(value)]"
            textCounter += 1
        }
    }
    return (newString, textCounter)
}

let words = ["Der", "frühe", "Vogel", "fängt", "den", "Wurm"]           // Ein Array aus Zeichenketten bilden...

let wordsConcat = concatStringsWithBrackets(words)                      // ... und die Funktion aufrufen

print("Neuer Text: \(wordsConcat.text)")                                // Ausgabe der Tupel-Werte
print("Verkettete Texte: \(wordsConcat.counter)")



/* VARIADISCHE PARAMETER:
Obwohl obige Funktion mit einer beliebigen Anzahl von Texten umgehen kann,
erwartet sie genau einen Parameter, nämlich ein Array mit Zeichenketten vom Typ String.
Dafür müssen sämtliche Werte zuvor in einem Array zusammengefasst werden.
Eine Alternative in Swift sind Funktionen mit variadischen Parametern, 
die eine bel. Anzahl von Argumenten gleichen Typs entgegen nehmen können.
"Variadic Parameter" oder "Parameter Ellipsis" oder "Ellipsis Operator" 
erkennt man an den drei Punkten hinter dem Datentyp des Parameters. */

// BSP 1:
func concatStringsWithBrackets (values:String...) ->(text:String, counter:Int)
{
    var newString = ""
    var textCounter = 0
    
    for value in values
    {
        if !value.isEmpty
        {
            newString += "[\(value)]"
            textCounter += 1
        }
    }
    return (newString, textCounter)
}

let words1 = concatStringsWithBrackets("Swift")
let words8 = concatStringsWithBrackets("Auf", "einen", "trüben", "Morgen", "folgt", "ein", "heiterer", "Tag")



// BSP 2:
func average(values:Double...) -> Double
{
    var sum = 0.0
    var counter = 0.0
    for value in values
    {
        sum += value
        counter += 1
    }
    return sum / counter
}
var avg1 = average(50.0)
var avg2 = average(4.1, 5.2, 6.0, 7.0)
var avg3 = average(5.5, 6.5, 7.8, 9.1)



/* IN-OUT-PARAMETER:
Parameter einer Funktion sind Kontanten!
Somit können die einer Fkt. übergebenen Werte 
innerhalb der Funktion nicht verändert werden.
Versucht man es doch, erhält man Fehlermeldungen:

 func myFunction(stringValue:String, intValue:Int) {
    stringValue = "Hallo Entwickler"                    ! Cannot assign to ´let´ value ´stringValue´
    intValue = 2015                                     ! Cannot assign to ´let´ value ´intValue´
 }

Soll der Parameterwert in der Funktion manipuliert werden,
kann dieser durch ein zusätzliches var in eine Variable verwandelt werden.
Jetzt wird allerdings nicht etwa der übergebene Wert bearbeitet.
Man erhält jetzt für den Gültigkeitsbereich der Funktion 
eine neue Variable mit einer Kopie des Wertes.
Jetzt können der Variablen andere Werte zugewiesen werden, 
doch der Wert außerhalb der Funktion ändert sich nicht. */

func myFunction(var intValue:Int)
{
    intValue = 2015
}
var year = 2014
myFunction(year)
print(year)             // year ist immer noch 2014 obwohl in der Funktion ein anderer Wert zugewiesen wird


/* Soll der an eine Funktion übergebene Wert trotzdem geändert werden, 
wird dies über das Schlüsselwort "inout" i.d. Deklaration ermöglicht.
Zusätzlich muss die übergebene Variable im Aufruf um ein "&" erweitert werden.
Mit dem "&" wird eine Speicheradresse gekennzeichnet.
So erhält die Funktion Zugriff auf den Wert an seiner
Speicheradresse und kann diesen dort ändern.
Der Funktionsaufruf funktioniert in dieser Form nur mit Variablen 
und nicht mit festen Werten, so genannten Literalen.
Konstanten können ebenfalls nicht als Parameter übergeben werden, 
wenn ein Argument mit inout gekennzeichnet ist. */

func myInOutFunction(inout intValue:Int)
{
    intValue = 2015
}

var thisYear = 2014             // die Variable ist allgemein deklariert

myInOutFunction(&thisYear)      // nach Aufruf der Funktion erhält sie über inout den Wert 2015

print(thisYear)                 // thisYear enthält jetzt den Wert 2015. Er wurde der Variablen in der Funktion zugewiesen



// WEITERE BEISPIELE FÜR FUNKTIONEN:
 
// Aus dem Vor- und Nachnamen sowie dem Geschlecht soll die Anrede für einen Brief zusammengesetzt werden:

func createAddress(firstName firstName:String = "", lastName:String = "", isMale:Bool) -> String
{
    var address = "\(firstName) \(lastName)"
    
    // Dieser Aufruf entfernt Leerzeichen am Anfang und am Ende der Zeichenkette
    address = address.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    
    if isMale
    {
        address = "Sehr geehrter Herr \(address)"
    }
    else
    {
        address = "Sehr geehrte Frau \(address)"
    }
    
    return address
}

var addressMale = createAddress(firstName: "Max", lastName: "Maulwurf", isMale: true)

var addressFemale = createAddress(lastName: "Schubert", isMale: false)



// Aus der Addition der Punkte zweier Koordinaten soll eine neue Koordinate berechnet werden:

typealias Coordinate = (x:Double, y:Double)
var pos = Coordinate(x:100.20, y:87.34)

func addCoordinates(c1:Coordinate, c2:Coordinate) -> Coordinate
{
    return Coordinate(x: c1.x + c2.x, y: c1.y + c2.y)
    // addiere beide Punkte x und beide Punkte y der Koordinaten
    // und gib die Summe als neue Koordinate aus
}
let posXFirst = Coordinate(x: 55.4, y: 44.4)
let posYFirst = Coordinate(y: 44.4, x: 55.4)
let sum = addCoordinates(posXFirst, c2: posYFirst)

// Alternative Lösung:
func addCoordinates2(c1: (x:Double, y:Double), c2: (x:Double, y:Double)) -> (x:Double, y:Double)
{
    return (x: c1.x + c2.x, y: c1.y + c2.y)
}
let posYFirst2 = (y: 44.4, x: 55.4)
let posXFirst2 = (x: 55.4, y: 44.4)
let sum2 = addCoordinates2(posXFirst2, c2: posYFirst2)




// Funktionen - Externe Parameternamen:
// Funktionen verwenden den Namen eines Parameters intern, damit ein übergebener Parameter im Code angesprochen werden kann:

func calc(n1:Int, n2:Int, op:String) -> Int {
    var result = 0
    
    switch op {
        case "+":
            result = n1 + n2
        
        case "-":
            result = n1 - n2
        
        default:
            result = n1 * n2
    }
    return result
}

// Die Übergabe der Parameter ist in diesem Beispiel nicht sehr aussagekräftig.
// Die folgende Variante dagegen dokumentiert sich quasi von selbst:

var newNumber = calc(2, n2:5, op: "+")
// Durch die Möglichkeit der Benennung der Parameter wird deren Bedeutung deutlich.
// Man spricht in diesem Fall von externen Parameternamen.

func calc(numberOne n1:Int, numberTwo n2:Int, optype op:String) -> Int {
    var result = 0
    
    switch op {
        
        case "+":
            result = n1 + n2
        
        case "-":
            result = n1 - n2
        
        default:
            result = n1 * n2
    }
    return result
}

// Gelegentlich kann es vorkommen, dass sowohl für den internen Parameternamen als auch für den externen Parameternamen
// dieselbe Bezeichnung verwendet werden soll. Hierbei stellt man einfach ein # voran.
// Bei dieser Konfiguration wird Swift sowohl für den internen als auch für den externen Parameter denselben Namen akzeptieren.


// Funktionen - Parameter vorbelegen:
// Parameter können vorbelegt werden. Das bedeutet: Bei dem Aufruf einer Funktion mit vorbelegten Parametern müssen nicht alle
// Parameter mit einem Wert initialisiert werden. Fehlt ein Wert für einen Parameter mit Vorbelegung, so wird der Standardwert
// beim Funktionsaufruf verwendet:

func calcWithDefaultValue(numberOne n1:Int, numberTwo n2:Int, op: String = "+") -> Int {
    var result = 0
    
    switch op {
        
        case "+":
            result = n1 + n2
        
        case "-":
            result = n1 - n2
    default:
        result = n1 * n2
    }
    return result
}

// Im Bsp. wird nun zusätzlich zum Datentyp String für den Operator das "+"- Zeichen hinterlegt.
// Swift erkennt aus der Vorbelegung automatisch, dass das + als Standardwert verwendet werden soll,
// sofern beim Aufruf der Funktion kein Wert eingegeben wurde:

var newNumber2 = calcWithDefaultValue(numberOne: 2, numberTwo: 5)



/*
 func addDoubleValues(value1:Double?, value2:Double?) -> Double
 {
 var result:Double = 0
 
 if value1 != nil && value2 != nil
 {
 result = value1! + value2!
 }
 
 return result
 }
 */

/*
 func addDoubleValues(value1:Double?, value2:Double?) -> Double
 {
 guard value1 != nil && value2 != nil else
 {
 print("Einer oder beide Parameter sind nil")
 return 0
 }
 
 return value1! + value2!
 }
 */


func addDoubleValues(value1:Double?, value2:Double?) -> Double
{
    guard let value1 = value1, let value2 = value2 else
    {
        print("Einer oder beide Parameter sind nil")
        return 0
    }
    
    return value1 + value2
}


var v1:Double? = 5.5
var v2:Double?  // Keine Zuweisung, v2 ist nil
print(addDoubleValues(v1, value2: v2))



// Ein Element im Array ist nil
var elements:[Int?] = [44,85,23,56,nil,27,73]
var elementSum = 0

// Die Summe der Werte berechnen
for element in elements
{
    guard element != nil else
    {
        continue
    }
    elementSum += element!
}

print(elementSum)


// Mit "init" und "deinit" (die Deklaration erfolgt ohne func) können Konstruktoren und Destruktoren bereitgestellt werden:

class Counter {
    var value : Int
    
    init() {
        self.value = 0
    }
    
    init(initialValue: Int) {
        self.value = initialValue
    }
    
    deinit {
        NSLog("+ Counter")
    }
}



// Funktionen als Datentypen:

var matheFunktion: (Int, Int) -> Int

func addieren(a: Int, _ b: Int) -> Int {
    return a + b
}

func subtrahieren(a: Int, _ b: Int) -> Int {
    return a - b
}

matheFunktion = addieren
matheFunktion(5,10)

matheFunktion = subtrahieren
matheFunktion(5,10)



// Funktionstypen als Parameter:

// mit Integer-Returnwert (Int, Int) -> Int
func Addieren(a: Int, _ b: Int) -> Int {
    return a + b
}
func berechne(funktion: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(funktion(a, b))
}
berechne(Addieren, 50, 25)


// ohne Return-Value als Parameter:
func Subtrahieren(a: Int, _ b: Int) {
    print(a - b)
}
func rufeAuf(funktionOhneReturn: (Int, Int) -> (), _ a: Int, _ b: Int) {
    funktionOhneReturn(a, b)
}
rufeAuf(Subtrahieren, 100, 50)



// Funktion als Rückgabewert:
func ADDIEREN(a: Int, _ b: Int) -> Int {
    return a + b
}

func SUBTRAHIEREN(a: Int, _ b: Int) -> Int {
    return a - b
}

func wieBerechnen(name: String) -> ((Int, Int) -> Int)! {
    switch name {
    case "plus":
        return ADDIEREN
    case "minus":
        return SUBTRAHIEREN
    default:
        print("Oops")
    }
    return nil
}
var MatheFunktion: (Int, Int) -> Int

MatheFunktion = wieBerechnen("minus")
MatheFunktion(5,10)


struct Benutzer {
    var alter = 0
    var name = ""
    var istMaennlich = false
    
    mutating func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func getAlter() -> Int {
        return alter
    }
    
    func getIstMaennlich() -> Bool {
        return istMaennlich
    }
}

var user = Benutzer(alter: 37, name: "Siggi!", istMaennlich: true)
user.getName()



// Typealias:
func aDDIEREN(a: Int, _ b: Int) -> Int {
    return a + b
}

func sUBTRAHIEREN(a: Int, _ b: Int) -> Int {
    return a - b
}

typealias berechnungsfunktion = (Int, Int) -> Int

func WieBerechnen(name: String) -> berechnungsfunktion! {
    switch name {
    case "plus":
        return aDDIEREN
    case "minus":
        return sUBTRAHIEREN
    default:
        print("Oops")
    }
    return nil
}
var MAtheFunktion: (Int, Int) -> Int

MAtheFunktion = wieBerechnen("minus")
MAtheFunktion(5,10)


// Vorzeitiges Ende mit "guard":
// Umständliche Prüfungsvariante mit if:

/*func addiereN(x: Int?, _ y: Int?) {
    
    if let a = x {
        if let b = y {
            print(a + b)
        } else {
            print("b ist nil")
        }
    } else {
        print("a ist nil")
    }
}*/

// Elegante Prüfungsvariante mit guard:
func addiereN(x: Int!, _ y: Int!) {
    guard x != nil else {
        print("x ist nil")
        return
    }
    guard y != nil else {
        print("y ist nil")
        return
    }
}

// Funktionsaufruf:
addiereN(5, nil)



// Klassenfunktionen / Statische Methoden:

class Benutzerkonto {
    class func randomPassword() {
        print(NSUUID().UUIDString)
    }
}
Benutzerkonto.randomPassword()              // Wichtig: Es muss/darf keine Instanz erzeugt werden.



// TODO: Fehler im folgenden Code: es wird nicht das erste Zeichen der sortierten Liste ausgegeben,
// sondern das erste Zeichen der initialen Liste

func minimal( liste:[Int]) -> Int {
    liste.sort(<)
    return liste.first!
}

func maximal( liste:[Int]) -> Int {
    liste.sort(>)
    return liste.first!
}
var minMaxFkt: ([Int]) -> Int
minMaxFkt = minimal
minMaxFkt([66, 23, 45])
minMaxFkt = maximal
minMaxFkt([66, 23, 45])

func testMinMax(decider: ([Int]) -> Int, intListe: [Int]) -> Int {
    return decider(intListe)
}
testMinMax(maximal, intListe: [1,2,3,4,5,6])


func groesserKleiner(groesser: Bool) -> ([Int]) -> Int {
    if groesser {
        return maximal
    } else {
        return minimal
    }
}
var biggest = groesserKleiner(false)
biggest([1,2,3,4,5,6])


// Funktion, welche überprüft, ob in einem Integer-Array ein Wert < 10 ist:

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }

let numbers = [30, 19, 11, 12]
hasAnyMatches(numbers, condition: lessThanTen)
