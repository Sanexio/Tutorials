// update 30.06.16, 12:30

import Cocoa
import Foundation

// Die Kontrollstrukturen werden in zwei Gruppen eingeteilt: FALLUNTERSCHEIDUNGEN UND SCHLEIFEN

print("IF-SCHLEIFE__________________________________________________________________________________")

var name = "Martina"
var result = ""

if name.hasSuffix("tina")
{
    result = "Der Name endet mit 'tina'."
}
else
{
    result = "Der Name endet nicht mit 'tina'."
}

print(result)

var prefix = "chr"
name = "Christina"

if name.lowercaseString.hasPrefix(prefix.lowercaseString)   // mit der Methode "lowercaseString" werden Groß- und Kleinschreibung ignoriert.
{
    result = "Der Name beginnt mit '\(prefix)'."
}
else
{
    result = "Der Name beginnt nicht mit '\(prefix)'."
}

print(result)


// Im folgenden Listing wird der größere der Werte zweier Variablen ermittelt:

var firstValue = 60
var secondValue = 50
var compared = ""

if firstValue > secondValue
{
    compared = "Der Wert von firstValue ist größer als der Wert von secondValue."
}
if  secondValue > firstValue
{
    compared = "Der Wert von secondValue ist größer als der Wert von firstValue."
}
if  firstValue == secondValue
{
    compared = "Die Werte von secondValue und firstValue sind gleich groß."
}

print(compared)

// Der obige Code ist keine optimale Lösung, da unnötige Vergleiche durchgeführt werden.
// Wenn wir wissen, dass firstValue größer als secondValue ist, müssen beide anderen Möglichkeiten nicht mehr geprüft werden:


if firstValue > secondValue
{
    compared = "Der Wert von firstValue ist größer als der Wert von secondValue."
}
else if  secondValue > firstValue
{
    compared = "Der Wert von secondValue ist größer als der Wert von firstValue."
}
else
{
    compared = "Die Werte von secondValue und firstValue sind gleich groß."
}

print(compared)

// Durch das "else if" wird die zweite Bedingung nicht geprüft, wenn bereits festgestellt wurde, dass firstValue > secondValue ist.
// Trifft keine der beiden Bedingungen zu, müssen die Werte zwangsläufig gleich groß sein.

// If-Strukturen in Swift akzeptieren ausschließlich boolesche Werte oder das Ergebnis boolescher Operatoren als Bedingung.
// Ist eine Bedingung erfüllt, ist ihr Ergebnis "true". Andernfalls ist sie "false".
// Damit können wir Strukturen entwickeln, deren Bedingungen immer oder nie erfüllt sind, indem wir direkt true oder false in die if-Struktur schreiben.
// Obwohl auf den ersten Blick vielleicht unnütz, können sie bei der Entwicklung und Fehlersuche wertvolle Hilfe leisten.
// Der Swift-Compiler ist hierbei in der Lage, unerreichbaren Code zu entdecken und wird Warnungen anzeigen.

if true
{
    result = "Diese Zuweisung wird immer augeführt"
}

if false
{
    result = "Diese Zuweisung wird niemals augeführt"
}

// Sollen in einer if-Struktur mehrere Bedingungen überprüft werden, können diese mit den booleschen Operatoren UND oder ODER verknüpft werden.
// Ein if, bei dem zwei Bedingungen erfüllt sein müssen, zeigt das nächste Listing.
// Der Wert der Variablen itemsCount muss größer als 60 UND kleiner als 80 sein.
// MEMO:
//      &&	UND Operator
//      ||	ODER Operator
//      !	NICHT Operator
//      <	kleiner als
//      >	größer als
//      <=	kleiner oder gleich
//      >=	größer oder gleich
//      ==	Gleichheitsoperator
//      !=	Ungleichheitsoperator
//      +	Addition
//      -	Subtraktion
//      *	Multiplikation
//      /	Division
//      %	Restwert-Operator

var itemsCount = 75
var countResult = ""

if itemsCount > 60 && itemsCount < 80
{
    countResult = "Der Wert von itemsCount ist größer als 60"
    countResult += " und kleiner als 80."
}

print(countResult)

// Eine if-Struktur mit einer ODER-Verknüpfung:
if itemsCount > 60 || itemsCount == 40
{
    countResult = "Der Wert von itemsCount ist größer als 60"
    countResult += " oder genau 40."
}

print(countResult)


// Um zu prüfen, ob ein Wert in einem Wertebereich enthalten ist, muss man in Swift nicht zwangsläufig boolesche Operatoren verwenden.
// Das gleiche Ergebnis kann man mit dem "Pattern-Match"-Operator erreichen.
// Im folgenden Listing wird geprüft, ob der Wert der Variablen "number" im Bereich "numbers" enthalten ist.
// Damit der Vergleich funktioniert, muss "numbers" explizit als "ClosedInterval" deklariert werden.
// Ohne Angabe würde der Compiler einen anderen Typ einsetzen, mit dem die Überprüfung nicht funktioniert:
var numbers:ClosedInterval = 1...100
var number = 90
if numbers ~= number                                // Pattern-Match-Operator
{
    print("\(number) ist im Interval enthalten.")
}
else
{
    print("\(number) ist im Interval nicht enthalten.")
}


var rating = 54
var ratingText = ""

if rating > 50 && rating != 55
{
    ratingText = "Der Wert von rating ist größer als oder gleich"
    ratingText += " 50 aber nicht 55."
}

print(ratingText)

print("SWITCH-CASE-STRUKTUR_________________________________________________________________________")

// Bei der Switch-Case-Struktur wird jede Bedingung als ein Fall behandelt.
// Trifft keiner der Fälle zu, können in einem default-case alle anderen Möglichkeiten verarbeitet werden:
var customers = 20
var customersText = ""
switch customers
{
case 20:
    customersText = "Wir haben 20 Kunden."
case 21:
    customersText = "Wir haben 21 Kunden."
case 22:
    customersText = "Wir haben 22 Kunden."
default:
    customersText = "Wir haben eine andere Anzahl von Kunden"
}

/* Im Gegensatz zur if-Struktur arbeitet ein switch-case nicht mit booleschen Operatoren, sondern mit den Werten, die eine Variable annehmen kann.
Deshalb ist es nicht möglich, mit Vergleichen wie "<", ">", etc. zu arbeiten.
In Swift kann ein case für mehrere Werte gelten: */

switch customers
{
case 20, 21, 22:
    customersText = "Wir haben 20, 21 oder 22 Kunden."
case 30, 31, 32:
    customersText = "Wir haben 30, 31 oder 32 Kunden."
default:
    customersText = "Wir haben eine andere Anzahl von Kunden"
}

// Zusätzlich ist es möglich, case-Blöcke mit Wertebereichen anzugeben, so dass nicht jeder Wert einzeln aufgeführt werden muss:
switch customers
{
case 1:
    customersText = "Wir haben einen Kunden."
case 2...20:
    customersText = "Wir haben zwei bis 20 Kunden."
case 21...50:
    customersText = "Wir haben 21 bis 50 Kunden."
default:
    customersText = "Wir haben eine andere Anzahl von Kunden"
}

/* Wie die verschiedenen Fälle in switch-case-Strukturen behandelt werden, ist eines der Merkmale, in denen sich Programmiersprachen voneinander unterscheiden.
In Swift wird eine switch-case Struktur verlassen, sobald der erste gültige Fall erreicht wurde.
Der Code der anderen Fälle wird dann gar nicht erst ausgeführt.
Mit "fallthrough kann der Programmablauf trotz schon eingetretener Gültigkeit an den nächsten Fall weitergereicht werden.
ACHTUNG: Ob der Fall ebenfalls gültig ist, wird jedoch nicht mehr geprüft. */

customers = 18
switch customers
{
case 2...20:
    customersText = "Wir haben zwei bis 20 Kunden."
    fallthrough
case 21...50:
    customersText += " Wir haben genügend Kunden."
default:
    customersText = "Wir haben nicht genügend Kunden."
}
print(customersText)

/* In Swift ist es nicht erforderlich, einen Fall explizit mit einer break-Anweisung zu beenden, um das Weiterreichen an den nachfolgenden Fall zu verhindern.
Das passiert automatisch. Allerdings benötigen switch-case-Strukturen in Swift immer einen default-Fall.
Soll dieser keine weiteren Anweisungen enthalten, kann er mit einem break umgehend beendet werden.
Einen default-Fall komplett ohne Befehle wird der Compiler nicht akzeptieren. */

switch customers
{
case 2...20:
    customersText = "Wir haben zwei bis 20 Kunden."
    // Die folgende break-Anweisung ist nicht erforderlich.
    break;
case 21...50:
    customersText = "Wir haben 21 bis 50 Kunden."
    // Die folgende break-Anweisung ist nicht erforderlich.
    break
default:
    // Hier gibt es nichts zu tun aber Swift benötigt immer einen default-Fall.
    break
}

// Eine switch...case-Abfrage kann zusätzlich noch eine Bedingung aufnehmen,
// die sogenannte where Klausel:

let auswahl = "braunlila"
switch auswahl {
    
    case "rot":
    let ausgabe = "Rot wurde gewählt."
    
    case "blau", "gelb":
    let ausgabe = "Blau oder Gelb wurde gewählt"
    
    case let x where x.hasSuffix("lila"):
    let ausgabe = "Enthält lila"
    
    default:
    let ausgabe = "Eine andere Farbe wurde gewählt"
}
// Im vorletzten Zweig wird eine Variable x erzeugt, mit der lediglich geprüft wird,
// ob innerhalb der gesamten Zeichenkette die Zeichenkombination lila enthalten ist.
// Mit der where-Klausel kann also eine zusätzliche Bedingung formuliert werden, die überprüft werden soll.

var preisVergleich = (min: 301, max: 500)

switch preisVergleich {
case (0...180, _):
    "Minimalwert: 0-180"
default:
    "ungültig"
}

switch preisVergleich {
case let(min, max) where min >= 300:
    "min2: \(min), max2: \(max)"
case let(min, max) where min >= 200:
    "min2: \(min), max2: \(max)"
default:
    "ungültig"
}


// Tuples abfragen mit wildcard:
let meinPunkt = (0, 0)

switch meinPunkt {
case (0, 0):
    print("Nullpunkt gefunden")

case (_, 0):
    print("liegt auf der X-Achse")
case (0, _):
    print("liegt auf der Y-Achse")

default:
    print("x: \(meinPunkt.0), y: \(meinPunkt.1)")
}


// Bereiche in Tuples abfragen: KIND -> Alter: >= 8 Jahre; Größe: >= 130cm

let kind = (8, 145)
var darfMitfahren = true

switch kind {
case (_, 0..<130):
    darfMitfahren = false
case (0..<8, _):
    darfMitfahren = false
default:
    break
}
darfMitfahren



print("FOR-SCHLEIFE_________________________________________________________________________________")

// Syntax einfache for-Schleife: for "initialisierung"; bedingung; de-/inkrementiert:
for var i = 0; i < 3 ; i+=1 {
    NSLog("i: \(i)")
}

// for .. in
var dieTeilnehmer = ["Anna": 1, "Katrin": 2]
for (name, id) in dieTeilnehmer {
    "\(name): \(id)"
}


// Die klassische for-Schleife benötigt im Schleifenkopf eine Laufvariable, sowie eine Bedingung, wie lange die Schleife laufen soll.
// Außerdem wird noch eine Anweisung benötigt, was bei jedem Durchlauf mit der Laufvariablen geschehen soll.
for var index = 1 ; index <= 10; index += 1     // initialisiere index mit dem Wert 1, erhöhe bei jedem Durchlauf um 1 bis index <= 10
{ print("Der Wert von index ist \(index).") }   // die Anweisung in den geschweiften Klammern wird nun 10 mal ausgeführt


// Im gezeigten Beispiel ist die Laufvariable vom Typ int, da der Compiler diesen Typ auswählt, wenn die Variable mit einer ganzen Zahl initialisiert wird.
// Benötigt man einen Double-Typ als Zähler kann man die Variable explizit als Double deklarieren oder ihr bei der Initialisierung eine Dezimalzahl zuweisen.
// Durch Deklarieren der Laufvariablen vor der Schleife wird sie in einen anderen Gültigkeitsbereich gelegt.
// So kann die Variable nach der Schleife auch noch verwendet werden. 
// Mit einer Laufvariablen, die im Schleifenkopf deklariert wird, funktioniert das nicht mehr.
// Eine for-Schleife muss in Swift immer einen Block aus geschweiften Klammern besitzen.
var doubleIndex:Double = 0  // Die Laufvariable wird VOR der Schleife deklariert

for doubleIndex = 1.0 ; doubleIndex <= 5; doubleIndex += 0.5    // dIndex bei jedem Durchlauf um 0.5 erhöhen
{
    print("Der Wert von doubleIndex ist \(doubleIndex).")
}

print("Der Wert von doubleIndex ist jetzt \(doubleIndex).")     // Die Laufvariable kann nach der Schleife noch verwendet werden


// Swift bietet zur Programmierung von for-Schleifen eine Alternative an, die als "for-in" - Schleife bezeichnet wird.
// Dort können die zu durchlaufenden Werte als Bereich - einer Range - definiert werden.
// Ein Bereich, der durch drei Punkte definiert ist, wird als "Closed-Range" bezeichnet.
// Zur Definition der Laufvariablen dard hier jedoch kein "var" angegeben werden:
for closedIndex in 1...10
{
    print("Der Wert von closedIndex ist \(closedIndex).")
}

// Deklariert man den Bereich mit nur zwei Punkten zwischen dem Start- und Endwert und einem "<"-Zeichen, erhält man ein anderes Ergebnis.
// Jetzt bricht die Schleife ab, bevor die Laufvariable den Wert 10 erreicht und nur die Werte 1 bis 9 werden ausgegeben.
// So ein Bereich wird als "Half-Open-Range" bezeichnet:
for halfClosedIndex in 1..<10
{
    print("Der Wert von halfClosedIndex ist \(halfClosedIndex).")
}

// Falls erforderlich, kann man die Range vor der Schleife deklarieren und den Start- und Endpunkt durch Variablen oder Konstanten festlegen.
// Ein Bereich funktioniert in Swift mit einer "for-in"-Schleife nur, wenn es sich beo den Werten um ganze Zahlen handelt.
var start = 5
var ende = 10
var range = start...ende
for rangeIndex in range
{
    print("Der Wert von rangeIndex ist \(rangeIndex).")
}

// Im Zusammenspiel mit einem Array kann eine Half-Open-Range in einer Schleife effektiv eingesetzt werden.
// Hierüber kann jedes einzelne Objekt einer Auflistung angesprochen werden.
// Im folgenden Listing wird jeder Eintrag im Array über seine Indexposition angesprochen.
// Wie weit die Schleife laufen muss, können wir aus der Länge des Array mittels der Eigenschaft "count" ermitteln.
// Die höchste Indexposition ist immer um den Wert 1 kleiner, als die Länge des Arrays!
var names = ["Marko","Christan","Petra","Maike","Johanna"]
for index in 0..<names.count
{
    print(names[index])
}
// Mit der gezeigten Vorgehensweise können auch in anderen Programmiersprachen Arrays durchlaufen werden.
// Man bezeichnet den Vorgang als "Iteration".

// In Swift gibt es zusätzlich eine elegantere Lösung, die keine Laufvariable und keine Indexposition benötigt und trotzdem jedes Objekt der Liste anspricht.
// Hierbei muss die Länge des Arrays nicht gesondert ermittelt werden und somit läuft man nicht Gefahr, eine Indexposition anzusprechen, die es nicht gibt.
for name in names
{
    print(name)
}

// Diese Schleife zählt RÜCKWÄRTS von 10 bis 5 in Schritten von 0.5:
for var hiDouble = 10.0 ; hiDouble >= 5.0 ; hiDouble -=  0.5
{
    print("Der Wert von hiValue ist \(hiDouble).")
}

// Man kann eine rückwärts zählende Schleife auch mit einer Close-Range doer Half-Open-Range realisieren.
// Einfach die Werte zu vertauschen, resultiert dabei aber in nicht funktionsfähigem Programm-Code:
// for reverseValue in 10...5 {    }   -> FEHLERMELDUNG!
// Eine Lösung für das Problem führt uns zu der Funktion "reverse", mit welcher der Wertebereich der Range umgekehrt werden kann.
// Die Range wird dabei in bekannter Art von einem kleinen hin zu einem größeren Wert definiert.
// Damit zählt die Schleife nun auch rückwärts:
for reverseValue in (5...10).reverse()
{
    print("Der Wert von reverse ist \(reverseValue).")
}

// Dein Einsatz der Funktion "reverse" ist nicht auf Bereich mit Zahlen oder auf das Innere einer Schleife begrenzt.
// Sämtliche Auflistungen können mit reverse umgekehrt werden.
// Zum Beispiel die Reihenfolge der Elemente in einem Array:
var letters = ["A","B","C","D","E"]
letters = letters.reverse()



print("WHILE-SCHLEIFE_______________________________________________________________________________")

var sechsGewürfelt = false

while sechsGewürfelt == false {
    var augenZahl = Int(arc4random_uniform(6)) + 1
    
    if augenZahl == 6 {
        sechsGewürfelt = true
    }
}

var durchlauf = 0
var maximum = 3

while durchlauf++ < maximum {
    "durchlauf: \(durchlauf)"
}

// while-Schleifen arbeiten nicht mit Laufvariablen, sondern laufen solange, bis eine genau definierte Abbruchbedingung eintritt.
// Oft kommen while-Schleifen in Situationen zum Einsatz, bei denen die Anzahl der Durchläufe zuvor nicht bekannt ist.
var index = 0
while index < 10
{
    print("Der Wert von index ist: \(index)")
    index += 1
}

// Der große Unterschied zu einer for-Schleife ist, dass bei while-Schleifen auch leicht mehrere Abbruchbedingungen angegeben werden können.
// Die Schleife im nächsten Listing läuft solange die Werte von cards ODER boxes kleiner als 10 sind.
var cards = 0
var boxes = 0.0

while cards < 10 || boxes < 10                  // While Schleife mit zwei Abbruchbedingungen
{
    print("Der Wert von cards ist: \(cards)")
    print("Der Wert von boxes ist: \(boxes)")
    cards += 1                                  // ??? Warum bricht die Schleife nicht bei Erreichen von "cards < 10" ab  ???
    boxes += 0.5                                // ??? Die Schleife bricht bei Erreichen der Bedingung "boxes = 9.5" ab ???
}
// Wären card UND boxes bereits vor Erreichen der while-Schleife größer als 10, würde die Schleife nie durchlaufen!
// Die Abbruchbedingung wäre hier nämlich schon erfüllt.

// Benötigt man eine Schleife, die mindestens einmal durchlaufen wird, so verwendet man eine "do-while"-Schleife.
// ACHTUNG: In Swift wird aktuell der Befehl "repeat - while" verwendet!
// Sie ist im Aufbau mit der while-Schleife verwandt, allerdings findet die Überprüfung der Abbruchbedingung erst am Ende der Schleife statt.
// Die Anweisungen in dem Block aus geschweiften Klammern werden mindestens ein Mal ausgeführt:

cards = 20
boxes = 50.0        // Die Variablen werden auf Werte gesetzt, die den Abbruchbedingungen entsprechen

repeat
{
    print("Der Wert von cards ist: \(cards)")
    print("Der Wert von boxes ist: \(boxes)")
    cards += 1
    boxes += 0.5
}
while cards < 10 || boxes < 10


// SCHLEIFEN MIT FALLUNTERSCHEIDUNGEN:

// Werden in einem Programm Schleifen und Fallunterscheidungen verschachtelt eingesetzt, lassen sich mit geringen Aufwand umfangreiche Abläufe kreieren.
// Mit dem folgenden Programm werden Kartons in einen Container verladen, wobei maximal 25 Kartons in einen Container passen.
// Ist der aktuelle Container voll, muss ein neuer Container verwendet werden.
// Hierbei wird mit dem Modulo-Operator (%) geprüft, ob die Indexposition des aktuellen Kartons ohne Rest durch 25 teilbar ist.
// Ist dies der Fall, müssen die Arbeiten mit einem neuen Container fortgeführt werden.

// 333 Kartons sollen verschifft werden:
var totalBoxes = 333
var totalContainer = 4
var containerCounter = 1
var boxesCounter = 1


for index in 1...totalBoxes
{
    print("Karton \(index) wird in Container geladen")
    
    if index % 25 == 0
    {
        print("Der Container ist voll.")
        print("Verwende neuen Container")
        containerCounter += 1
    }
}

var message = "\(totalBoxes) Kartons benötigen "
message += "\(containerCounter) Container"
print(message)


for index in 1...totalBoxes
{
    print("Karton \(index) wird in Container geladen")
    
    if index % 25 == 0
    {
        if containerCounter < totalContainer
        {
            print("Der Container ist voll.")
            print("Verwende neuen Container.")
            containerCounter += 1
        }
        else
        {   // If-Strukturen innerhalb von Schleifen können auch verwendet werden, um eine Schleife vorzeitig zu beenden.
            // So können for-Schleifen, die außer ihrer Laufvariablen keine Abbruchbedingung haben, abgebrochen werden.
            // Die Anweisung break übernimmt diese Aufgabe.
            print("Keine leeren Container verfügbar.")
            print("Der Vorgang wird abgebrochen.")
            // Die Schleife abbrechen
            break;
        }
    }
    boxesCounter += 1
}

var message2 = "\(boxesCounter) Kartons verladen "
message2 += "in \(containerCounter) Container"
print(message2)


// Durch das Verwenden der "continue"-Anweisung wird die Schleife nicht abgebrochen, sondern die Verarbeitung der Anweisungen für einen Durchlauf ausgesetzt.
// Trifft der Programmablauf auf ein continue, springt er sofort zurück zum Schleifenkopf und beginnt dort mit dem nächsten Durchlauf.
// Im folgenden Listing wird so die Ausgabe für Samstag und Sonntag unterbunden. "continue" funktioniert ebenfalls bei while-Schleifen.

var days = ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]

for day in days
{
    if day == "Sonntag" || day == "Samstag"
    {
        // Weitere Verarbeitung in der Schleife überspringen
        continue
    }
    print("Es ist \(day). Wir gehen zur Arbeit.")
}



print("REPEAT-WHILE-SCHLEIFE________________________________________________________________________")
// in Swift: repeat-while

var i = 0
repeat {
    "i: \(i+=1)"
} while (i<3)


var geradeZahl: Int

repeat {
    geradeZahl = Int(arc4random_uniform(100)) + 1
    print(geradeZahl)
} while geradeZahl % 2 != 0



// DIAGRAMME IM AUSGABEBEREICH:

// Werden Variablen innerhalb einer Schleife unterschiedliche Zahlenwerte zugewiesen, 
// erhalten wir im Ausgabebereich Diagramme und keine Wertetabellen.
// Die Diagramme repräsentieren den zeitlichen Verlauf der Variablen. 
var helperValue = 0;
var finalValue = 0

for index in 1...100
{
    if index % 3 == 0 || index % 2 == 0
    {
        helperValue = 0
    }
    else
    {
        helperValue = index
    }
    
    finalValue = helperValue
}

var cosValue = 0.0
var sinValue = 0.0

for var counter = 0.0; counter < 25; counter = counter + 0.1
{
    cosValue = cos(counter)
    sinValue = sin(counter)
}

// Kontrollstrukturen sind die essentiellen Merkmale einer jeden Programmiersprache.
// Sprachen wie HTML ermöglichen weder Schleifen noch Fallunterscheidungen und können 
// deshalb nicht als Programmiersprachen bezeichnet werden.
// Sie werden deklarative Sprachen genannt.


// for-Schleifen und Arrays / Dictionaries:
let myNames = ["Jan", "Anton", "Frank"]

for name in myNames {
    print("Aktueller Name: \(name)")
}

let myDict = ["alter": "33", "name": "Jan"]

for (key, value) in myDict {                        // Sollen Schlüssel oder Wert weggelassen werden, so kann der entsprechende Eintrag mit "_" markiert werden.
    print("Key \(key) hat den Wert \(value)")       // Bsp.: for (key, _) in myDict {...   gibt nur die Schlüssel aus.
}

for i in 0 ..< myNames.count {
    print(myNames)
}


print("Switch-Case-Statements_______________________________________________________________________")

// inkl. fallthrough-Eigenschaft:

var tor = 3

switch tor {
case 1:
    fallthrough
case 2:
    "Leider nicht gewonnwn"
case 3:
    "Gewonnen"
default:
    "Ungültiges Tor"
}

switch tor {
case 1...2:
    "Leider nicht gewonnen"
case 3:
    "Gewonnen"
default:
    "ungültig"
}



// Die Keywords "continue" und "break":

for zahl in 1...20 {
    if zahl % 2 != 0 {
        continue                                // beendet die aktuelle Wiederholung und nicht den kompletten Schleifendurchlauf
    }
    print(zahl)
}

var zufall = 0
while true {                                    // Endlosschleife
    zufall = Int(arc4random_uniform(10000))
    if zufall > 5000 {
        break                                   // kann mit einer Abbruchbedingung beendet werden
    }
}
print("Zufall: \(zufall)")