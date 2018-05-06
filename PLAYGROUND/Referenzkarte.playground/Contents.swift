import Cocoa
import XCPlayground


// NSLog:
NSLog("Hallo")
NSLog ("%d",1234)

var fValue: Float = 123.986
NSLog ("%f",fValue)

for var i = 1 ; i <= 10; i += 1
{
    // NSLog ("i :\(i)")
}



// VARIABLE:
var variablerWert = 3.1415
variablerWert = 3.0

// KONSTANTE:
let constValue = 42
// Neue Zuweisung nicht möglich
// constValue = 50 : Fehler!



// FALLUNTERSCHEIDUNGEN:
var salary = 12000

if salary > 15000 { print("Zu viel") }
    
else if salary < 10000 { print("Zu wenig") }

else { print("Ok") }
print("                                                                              <--- if-Schleife")


var index = 4

switch index
{
case 1:
    print("Index ist 1")
case 2:
    print("Index ist 2")
case 3...5:
    print("Index liegt zwischen 3 und 5")
case 6:
    print("Index ist 6")
    fallthrough
default:
    print("Index liegt nicht zwischen 1 bis 5")
}
print("                                                                              <--- switch-case")


for var index = 0; index <= 5; index += 1
{
    print(index, terminator: "") // Ausgabe von 0 bis 5
}

for index in 0...5 // Closed Range
{
    print(index) // Ausgabe von 0 bis 5
}

for index in 0..<5 // Half-Open Range
{
    print(index) // Ausgabe von 0 bis 4
}

for index in (5...10).reverse()
{
    print(index) // Ausgabe von 10 bis 5
}
print("                                                                             <--- for-Schleife")


var access = 1
repeat
{
    print((access), terminator: " ") // Ausgabe von 1 bis 9
    access += 1
}
while access < 10
print()
print("                                                                             <--- repeat-while")



// FUNKTIONEN:
// Ohne Parameter und ohne Rückgabewert:
func doSomething()
{
    print("Hello World!")
}

doSomething()
print("                                                                <--- doSomething ohne Rückgabe")

// Mit einem Double als Parameter und einem Double als Rückgabewert:
func doSomething(value:Double) -> Double
{
    return value * 2.0
}

var twice = doSomething(4.5)

// Mit zwei benannten Parametern und einem Double als Rückgabewert
func doSomething(firstValue first:Double, secondValue second:Double) -> Double
{
    return first + second
}

var sum = doSomething(firstValue: 3.2, secondValue: 4.7)



// ARRAY:

var städte:[String] = ["Rom","Paris","Berlin"]
städte.append("London")

for city in städte
{
    print((city), terminator: "  ") // Ausgabe alle Städtenamen
}
print ("---")

var count = städte.count // Anzahl der Elemente
print("                                                                                    <--- Array")



// DICTIONARY
var animals:[Int: String] = [11:"Hund", 22:"Katze", 33:"Maus"]
animals[22] = "Elefant" // Element ersetzten
animals[99] = "Huhn" // Element anfügen

print(animals[22]) // Ausgabe "Optional (Elefant)"
print(animals[99]) // Ausgabe "Optional (Huhn)"

animals[11] = nil // Element entfernen
print("                                                                               <--- Dictionary")



// ZEICHENKETTEN:
var firstName = "Mike"
var lastName = "Müller"

// String Interpolation:
print("Meine Name ist \(firstName) \(lastName).")

// Zahlenwerte formatieren
var numeric = 3.34983632
var num = String(format:"%.2f", numeric) // Ausgabe 3.35

// Enumerationen
enum Color
{
    case Red
    case Green
    case Blue
}
var exterior:Color = Color.Green

// Klassen
class Person
{
    // Eigenschaften
    var firstName:String
    var lastName:String
    
    init()
    {
        // Eigenschaften initialisieren
        firstName = ""
        lastName = ""
    }
}

// Klasseninstanz erzeugen und
// Eigenschaften zuweisen
var pers = Person()
pers.firstName = "Mike"
pers.lastName = "Müller"


enum CalculationError : ErrorType
{
    case DivideByZero
    case OtherError
}

func divide(dividend:Int, divisor:Int) throws -> Int
{
    guard divisor > 0 else
    {
        throw CalculationError.DivideByZero
    }
    return dividend / divisor
}

do
{
    var result = try divide(100, divisor: 0)
}
catch(CalculationError.DivideByZero)
{
    print("Es wurde versucht durch null zu teilen")
}
catch
{
    print("Ein anderer Fehler ist aufgetreten")
}


// Alias für einen (Double, Double) Tuple
typealias Coordinate = (x:Double, y:Double)

let pos1 = Coordinate(y: 44.4, x: 55.4)
let pos2 = Coordinate(x: 55.4, y: 44.4)

func addCoordinates(
    c1:Coordinate, c2:Coordinate) -> Coordinate
{
    return Coordinate(x: c1.x + c2.x, y: c1.y + c2.y)
}

let posSum = addCoordinates(pos1, c2: pos2)

// -- Any Object
// Zuweisung einer Zeichenkette
var value:AnyObject = "Köln"
// Zuweisung eines anderen Wert und Typ
value = 123345

// -- Array
// Ein Array aus ganzen Zahlen
var numbers = [1, 5, 7 ,9 ,12 ,13, 20]
var number = numbers[2]

// Ein Array aus Zeichenketten
var names = ["Petra", "Michael", "Andreas", "Marika"]
var name = names[2]

// Ein Array aus unterschiedlichen Typen
var any:AnyObject = ["Rom", "Paris", 10, 20, 4.5, 5.6]

var city = [String]()
// Einzelne Elemente anhängen
city.append("Rom")
city += ["Athen"]
// Ein Array anhängen
city += ["London", "Berlin"]
// Ein neues Element an Position 0 einfügen
city.insert("Tokyo", atIndex: 0)

// Element an Position 0 entfernen
city.removeAtIndex(0)
// Elemente an den Positionen 1 bis 2 entfernen
city.removeRange(1...2)
// Alle Elemente entfernen
city.removeAll(keepCapacity: true)

// -- Dictionary
// Definition eines Dictionary
// Schlüssel und Wert verwenden den Typ String
var colors
    = ["RED":"Rot", "BLUE": "Blau", "GREEN":"Grün"]
var myColor = colors["RED"]

// Definition eines Dictionary mit einem String
// für die Schlüssel und ganzen Zahlen als Werte
var values = ["First":1, "Last":100, "Default":50]
var myValue = values["Default"]

// Definition eines Dictionary mit einem String
// für die Schlüssel und ganzen Zahlen als Werte
var numericNames = [String:Int]()
// Zusätzliche Wertepaare hinzufügen
numericNames.updateValue(1, forKey: "eins")
numericNames.updateValue(2, forKey: "zwei")
numericNames.updateValue(10, forKey: "zehn")

numericNames.removeValueForKey("eins")
numericNames.removeAll(keepCapacity: true)

// do-catch-Struktur
enum CalcError : ErrorType
{
    case DivideByZero
    case SomethingWrong
    case OtherError
}

func div(divident:Int, divisor:Int) throws -> Int
{
    guard divisor > 0 else
    {
        throw CalculationError.DivideByZero
    }
    return divident / divisor
}

do
{
    var result = try divide(100, divisor: 0)
}
catch(CalculationError.DivideByZero)
{
    print("Es wurde versucht durch Null zu teilen")
}
catch
{
    print("Ein anderer Fehler ist aufgetreten")
}

// -- Enumeration
// Definition einer Enumeration
enum Cities
{
    case Berlin
    case London
    case Paris
    case Wien
}

// Zuweisung eines Wertes
// aus einer Enumeration
var hometown = Cities.Berlin

// Fallunterscheidung mit einem
// Wert aus einer Enumeration
if hometown == Cities.Berlin
{
    print("Wir fahren nach Berlin")
}

// --Fallunterscheidungen
var value1 = 50
var value2 = 49

if value1 > value2
{
    print("value1 ist größer als value2.")
}
else if value1 < value2
{
    print("value1 ist keiner als value2.")
}
else
{
    print("value1 und value2 sind gleich groß.")
}

var itemValue = 101

switch itemValue
{
case 50:
    print("Der Wert ist 50.")
    break
    
case 100:
    print("Der Wert ist 100.")
    break
    
case 101...1000:
    print("Der Wert liegt zwischen 101 und 1000.")
    fallthrough
    
default:
    break
}

enum Gender
{
    case Male
    case Female
}

var girl = Gender.Female

switch girl
{
case .Female:
    print("Mädchen")
    
case .Male:
    print("Junge")
}


//XCPSetExecutionShouldContinueIndefinitely(true)
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

// -- Format Specifier

var double = 3.14159265
// Double als String mit zwei Nachkommastellen
var t2N = String(format: "%.2f", double)
// Double als String mit vier Nachkommastellen
var t4N = String(format: "%.4f", double)

var ind = 100
// Int als String mit zusätzlichem Text
var i = String(format: "Der Wert ist: %i", ind)

var a1 = 45.2354
var a2 = 67.8823
// Umwandlung mehrerer Werte
var z = String(
    format: "%.2f + %.2f ist %.2f.", a1, a2, a1+a2)

var firstN = "Lisa"
var lastN = "Lee"
var nameN = String(format: "%@ %@", firstN, lastN)

var byte = 255
// Umwandlung von 255 in "FF"
var bUppercase = String(format: "%X", byte)
// Umwandlung von 255 in "ff"
var bLowercase = String(format: "%x", byte)

// Umwandlung von true in "1"
var expression = true
var e = String(format: "%@", expression)

// - Funktionen

// Eine Funktion, die einen Parameter entgegennimmt,
// aber keinen Wert zurückgibt
func outputValue(value:Double)
{
    print("Der Wert ist: \(value)")
}

// Funktionsaufruf
outputValue(67.42)

// Eine Funktion, die zwei Parameter entgegennimmt
// und einen Wert zurückgibt
func addValues(value1:Double, value2:Double) -> Double
{
    return value1 + value2
}

// Funktionsaufruf
var result = addValues(55.22, value2:99.11)

// Eine Funktion, die keine Parameter entgegennimmt
// und einen Tupel zurückgibt
func getDummyName() -> (firstname:String, lastName:String)
{
    return ("Max", "Müller")
}

// Funktionsaufruf und Ausgabe
var max = getDummyName()
print("\(max.firstname) \(max.lastName)")

// -- Grand Central Dispatch

// Warteschlange vom System anfordern
let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)

// Closure-Block der Warteschlange hinzufügen und ausführen
dispatch_async(queue)
{
    var sum = 0.0;
    for i in 1  ..< 1000 
    {
        sum = sum + Double(i)
    }
    print("Die Summe ist: \(sum)")
}


// guard-Struktur
var items = [3, 8, 2, -1, 9, 5, -6, 0]
var sum2 = 0

for item in items
{
    guard item >= 0 else
    {
        // Nur positive Zahlen addieren
        continue
    }
    sum2 = sum2 + item
}

func addTwoValues(first first:Int,second:Int) -> Int
{
    guard first >= 0 && second >= 0 else
    {
        // Nur positive Werte addieren!
        return 0
    }
    return first + second
}
// Ist ein Parameter eine negative Zahl
// ist der Rückgabewerte der Funktion immer 0
var sumValues = addTwoValues(first: -14, second: 5)

// -- Gültigkeitsbereiche
// Äußerer Gültigkeitsbereich
var value1x = 100
var value2x = 200
var value3x = 300

// if-Struktur mit einem eigenen Gültigkeitsbereich
if value1x == 100
{
    // value1 kann hier angesprochen werden
    value1x = 50
    
    // Neue Variable nur für inneren Gültigkeitsbereich
    var value4x = 400
    
    // Der Name value2 kann hier erneut verwendet werden
    // und erzeugt eine neue Variable nur
    // für inneren Gültigkeitsbereich
    var value2x = 20
}

// value1 ist hier 50
// value2 ist hier 200
// value3 ist hier 300
// value4 ist hier nicht bekannt

// -- Initializer
/*
 public class Cube
 {
 var length:Double
 var height:Double
 var width:Double
 
 // Der Initialiser setzt die Werte
 // der drei Eigenschaften
 init()
 {
 self.length = 0.0
 self.height = 0.0
 self.width = 0.0
 }
 }
 */

public class Cube
{
    var length:Double
    var height:Double
    var width:Double
    
    // Der Convenience-Initializer benötigt
    // beim Aufruf keine Parameter, verweist
    // aber an den Designated-Initalizer
    convenience init()
    {
        self.init(length: 0.0,height: 0.0,width: 0.0)
    }
    
    // Der Designated-Initializer erwartet
    // beim Aufruf keine Parameter
    init(length:Double, height:Double, width:Double)
    {
        self.length = length
        self.height = height
        self.width = width
    }
}

// -- Konstanten
// Definition einer Konstanten
let city2:String
// Der Erste Wert wird erst nach der Deklaration zugewiesen
city2 = "Köln"
// Eine erneute Zuweisung ist nicht möglich
// city = "Bonn"

// -- Konvertierung, explizit
// Int in Double umwandeln
// Nachkommastellen werden abgeschnitten
var dValue:Double = 55.44
var iValue:Int = Int(dValue)

// Int in Double umwandlen
var ixValue: Int = 777
var dxValue:Double = Double(ixValue)

// Int in String umwandeln
var intValue:Int = 9876
var intString:String = "\(intValue)"

// Double in String umwandeln
// Mit Angabe von zwei Nachkommastellen
var doubleValue = 98.7654
var doubleString = String(format:"%.2f", doubleValue)

// String in einen Int? umwandlen
var source:String = "1000"
var destination:Int? = Int(source)

// Double in einen String umwandeln
// Benötigt einen NSFormatter, um die Bedeutung von
// Punkt und Komma aus den Landeseinstellungen
// zu verwenden. Optionals sind erforderlich, weil
// Konvertierungen fehlschlagen können
var numericString = "120,345"
var formatter = NSNumberFormatter()
formatter.locale = NSLocale.currentLocale()
var number2:NSNumber? = formatter.numberFromString(numericString)
var numericDouble:Double? =  number2?.doubleValue

//-- Optional-Binding
// Ein Double-Optional
var result2:Double? = 99.9

// Der Optional wird in einen regulären Typ
// umgewandelt, wenn der Optional nicht nil ist
if let data2 = result2
{
    // Die Konstante data ist nur im Gültigkeitsbereich
    // der if-Struktur bekannt
    print("Der Wert ist: \(data2).")
}
else
{
    print("Der Optional enthält keinen Wert.")
}

// -- Range
var citiesEU = ["London", "Paris", "Bern", "Rom", "Berlin"]

// Closed Range
// Enthält Bern, Rom und Berlin
var cities1 = citiesEU[2...4]

// Half-Open Range
// Enthält Bern und Rom
var cities2 = citiesEU[2..<4]

// Definition einer Half-Open Range
// als Konstante
let range = Range(start: 2, end: 4)

// Enthält Bern und Rom
var cities3 = citiesEU[range]

// Half-Open Range
// Erzeugt den Werteberiech 1 bis 9
let numbers3 = Range(start: 1, end: 10)

// In der Schleife werden die Zahlen
// 1 bis 9 ausgegeben
for num in numbers3
{
    print(num)
}

// In der Schleife werden die Zahlen
// 20 bis 30 ausgegeben
for index in 20...30
{
    print(index)
}


// -- Schleifen

// for-Schleife
// Die Zahlen 0 bis 5 werden ausgegeben
for var index = 0; index < 5; index++
{
    print(index)
}

// for-in-Schleife
// Die Zahlen 0 bis 5 werden ausgegeben
for index in 1...5
{
    print(index)
}

// for-in-Schleife
// Die Städtenamen werden ausgegeben
var cities4 = ["New York", "Rio", "Tokio"]
for city in cities4
{
    print(city)
}

var counter = 10
// repeat-while-Schleife
// Die Zahlen 10 bis 1 werden ausgegeben
repeat
{
    print(counter)
    counter--
}
    while counter > 0

var position = 0
// while-Schleife
// Keine Ausgabe, denn die Abbruchbedingung
// ist bereits erfüllt
while counter > 0
{
    print(counter)
    counter--
}

//-- String-Dependency
var cityL = "london"

// Keine Übereinstimmung!
if cityL == "London"
{
    print("Wir fahren nach London.")
}

//-- String-Interpolation

// Zeichenketten werden per String-Interpolation verkettet
var vehicle = "Auto"
var destinationB = "Berlin"
var text = "Wir fahren mit dem \(vehicle) nach \(destinationB)."

// String-Interpolation mit einer Berechnung
var x1 = 45
var x2 = 54
print("Die Summe von \(x1) und \(x2) ist \(x1+x2).")

// -- Subscripting
// Zugriff auf die Zeichenkette "Paris", dem
// dritten String im Array
var europeanCities = ["London","Berlin","Paris","Wien"]
var hometownE = europeanCities[2]

//-- Type-Inference
// Typ wird als Int erkannt
var itemsCount = 99
// Typ wird als Double erkannt
var taxtRate = 7.5
// Typ wird als Zeichenkette (String) erkannt
var customerName = "Sabine Schuster"

//-- Überladung
// Zwei Methoden des Namens addValue
// Der Rückgabetyp beider Methoden ist ein Double

// Methode nimmt zwei Double-Werte entgegen
func addValues(valueX:Double, valueY:Double) -> Double
{
    return valueX + valueY
}

// Methode nimmt zwei Int-Werte entgegen
func addValues(valueX:Int, valueY:Int) -> Double
{
    return Double(valueX + valueY)
}

let const1 = addValues(20, value2:30)
let const2 = addValues(20.5, value2:30.1)














