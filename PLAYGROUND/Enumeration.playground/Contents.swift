// update: 26.07.2016; 09:00

// ENUMERATIONEN:

/* Beispiele: NSComparisionResult und NSCharacterSet
Aufzählungstypen definieren einen begrenzten Wertebereich. 
Es wird also eine Variable deklariert, deren mögliche Inhalte
bereits vor der Deklaration festgelegt werden. 

        /* enum Aufzaehlung {
            case Gestern
            case Heute
            case Morgen
        } */

// Aufruf über den vegebenen Namen: var zeitpunkt = Aufzaehlung.Heute

// Kurzscheibweise: enum Aufzaehlung { case Gestern, Heute, Morgen }

// Im folgenden Listing haben wir es mit einer Situation zu tun, die in der englischen Dokumentation
// als String-Dependency bezeichnet wird, der Abhängigkeit von Zeichenketten.
// Tatsächlich ist eine einwandfreie Funktion von der korrekten Schreibweise der Zeichenketten
// abhängig und schon ein kleiner Schreibfehler kann fatale Folgen haben.

import Cocoa

var color = "RedColor"

if color == "BlueColor"
{
    print("Blaue Farbe wird verwendet.")
}
else if color == "RedColor"
{
    print("Rote Farbe wird verwendet.")
}
else if color == "BlackColor"
{
    print("Schwarze Farbe wird verwendet.")
}

// Eine Möglichkeit, den Code von der String-Dependency zu befreien, wäre die Verwendung von Zahlen.
// Jeder Farbe würde eine Nr. zugeordnet und diese durch die if-Strukturen überprüft.
// Das hätte aber zur Folge, dass der Entwickler eine Tabelle pflegen müsste, in der festgehalten wird,
// welche Farbe welcher Zahl entspräche. Übersichtlich und leicht verständlich wäre der Code dann nicht mehr.

// Eine gute Alternative bieten Enumerationen, die Aufzählungstypen.
// Sie ermöglichen die Unverwechselbarkeit von Zahlen und gut lesbarem Programmcode.
// Sie werden in Swift mit dem Schlüsselwort "enum" deklariert, gefolgt von dem Namen, den die Aufzählung bekommen soll.
// In einem Block aus geschweiften Klammern folgt eine Auflistung aller möglichen Werte, 
// welche die Enumeration anbieten soll.

        /* public enum Color
        {
            case Blue
            case Red
            case Black 
        } */

// Statt einer Zeichenkette kann die Zuweisung der Variablen "color" jetzt mit einem Wert aus der Enumeration erfolgen.
// Benötigt werden der Typ der Enumeration und ein Wert aus der Auflistung, die durch einen Punkt getrennt werden.
// Soll im Listing weiterhin die rote Farbe verwendet werden, sähe das so aus:

        // var color = Color.Red

// Die if-Strukturen können jetzt nicht länger eine Zeichenkette vergleichen, sie müssen nun ebenfalls mit Werten aus dem Enum arbeiten.

        /* if color == Color.Blue
        {
            print("Blaue Farbe")
        }
        else if color == Color.Red
        {
            print("Rote Farbe")
        }
        else if color == Color.Black
        {
            print("Schwarze Farbe"
        } */

// String-Dependency gibt es im Listing jetzt nicht mehr.
// Sämtliche Enum-Werte sind dem Compiler bekannt, sodass er ungültige Anweisungen erkennen kann.
// Enumerationen in Swift sind typsicher. Wurde eine Variable oder eineKonstante als Typ eines bestimmten Enums definiert,
// kann ihr kein Wert einer anderen Enumeration zugewiesen werden.
// In vielen anderen Programmiersprachen verbergen sich hinter Enumerationen nur Zahlen, sodass es möglich ist, den Wert eines 
// Enums mit einer Zahl zu vergleichen. Dies funktioniert in Swift nicht.

// In manchen Situationen kann der Code bei der Verwendung von Enumerationen abgekürzt werden. 
// Ist der Compiler in der Lage, den Typ eines Enums selbstständig zu erkennen, muss der Typ nicht angegeben werden.
// Es genügen ein Punkt und der Name des Wertes.
// Wie im nächsten Listing erkennbar, funktionieren Enumerationen auch problemlos in switch-case-Strukturen:

        /* var color: Color = .Red
 
        switch color
        {
            case .Blue:
                print("Blaue Farbe")
            case .Red:
                print("Rote Farbe=)
            case .Black:
                print("Schwarze Farbe")
        } */



// ENUMERATIONEN MIT METHODEN:
// In vielen Programmiersprachen sind Enumerationen lediglich Auflistungen von Werten, doch in Swift können sie zusätzlich
// um Methoden erweitert werden.
// Mit einer init-Methode kann sogar festgelegt werden, welcher Wert gesetzt ist, wenn eine Enum-Variable angelegt wird.
// Ist man in einem existierenden Programm auf String-Dependencies angewiesen, vielleicht weil die Zeichenketten aus einer externen
// Datenquelle kommen, kann man die Methode eines Enums verwenden, um den Wert für die Anwendung zu konvertieren.
// So kann im Programm Typsicherheit geschaffen werden, ohne dass die bestehenden Daten verändert werden müssen.
// Zwar gibt es bei der beschriebenen Vorgehensweise weiterhin die Gefahr von Schreibfehlern,
// jedoch nur an einer Stelle im Projekt.


public enum Color
{
    case Blue
    case Red
    case Black
    
    init()
    {
        self = .Red
    }
    
    // Init-Methode erwartet eine Zeichenkette als Parameter:
    init(stringValue:String)
    {
        if stringValue == "BlueColor"
        {
            self = .Blue
        }
        else if stringValue == "RedColor"
        {
            self = .Red
        }
        else
        {
            self = .Black
        }
    }
    
    // Funktion liefert zum Enum-Wert eine passende Zeichenkette:
    public func getEnumValueAsString() -> String
    {
        switch self
        {
        case .Blue:
            return "BlueColor"
        case .Red:
            return "RedColor"
        default:
            return "BlackColor"
        }
    }
}

// Zuweisung eines Wertes aus einem Enum
let enumColor = Color.Red

if enumColor == Color.Blue
{
    print("Blaue Farbe wird verwendet.")
}
else if enumColor == Color.Red
{
    print("Rote Farbe wird verwendet.")
}
else if enumColor == Color.Black
{
    print("Schwarze Farbe wird verwendet.")
}

public enum Direction
{
    case Up
    case Down
    case Left
    case Right
}

// Die Zuweisung ist nicht erlaubt, denn Enumerationen sind typensicher: var movement:Direction = Color.Red

// Vergleiche von Emum-Werten und Zahlen sind in Swift nicht zulässig: if movement == 0

let backColor:Color = .Red

switch backColor
{
case .Blue:
    print("Blaue Farbe wird verwendet.")
case .Red:
    print("Rote Farbe wird verwendet.")
case .Black:
    print("Schwarze Farbe wird verwendet.")
}

// Ein neue Color-Enum mit dem Startwert, der in der init-Methode gesetzt wird
var favoriteColor = Color()

let carColor = Color(stringValue: "BlueColor")
if carColor == .Blue
{
    print(carColor.getEnumValueAsString())
}


// Assoziierte Werte in Enumerationen:
// Man kann bestimmte Typen den Aufzählungen zuordnen:

        /* enum Zahlen {
            case EinsbisDrei(Int, Int, Int)
            case VierBisFünf(String, String, String)
            case SechsBisNeun(Int, Int, Int)
        } */

// Einer Enumeration kann man übrigens nicht nur einen Wert, sondern sogar mehrere Werte über Tupel zuweisen
// Im Gegensatz zu C sind Enumerationen in Swift nicht direkt mit einem (Integer)-Wert belegt.
// Unter Swift sind Enumerationen flexibler, was die Zuordnung von Werten betrifft.



enum Fehlertyp: Int {
    case Hinweis = 1
    case Warnung = 2
    case Ausnahme = 3
}

var meinFehler = Fehlertyp.Warnung
switch meinFehler {
case .Hinweis: "Hinweis einblenden"
case .Warnung: "e-Mail an Admin"
case .Ausnahme: "SMS versenden"
}

Fehlertyp.Hinweis.rawValue








