// update: 27.06.16

// STRUKTUREN: VALUE TYPES
import Cocoa

/* In vielen Programmiersprachen zählen Strukturen und Enumerationen zu den seltener verwendeten Bausteinen,
   denn ihre Möglichkeiten dort sind sehr eingeschränkt. Strukturen werden eingesetzt, um mehrere Datentypen
   zu einem neuen Typ zu verbinden, bspw. um zwei Double-Typen zu einem Typ "Coordinate" mit einem
   X- und einem Y-Wert zusammenzufassen.
   Strukturen in Swift sind sehr leistungsfähig und können fast alle Aufgaben einer Klasse übernehmen.
   Zwischen Strukturen und Klassen gibt es einen sehr wichtigen Unterschied: Objekte, die aus Klassen instanziiert
   wurden, werden immer als Referenz übergeben, Instanzen, die eine Struktur als Bauplan verwenden, immer als Wert.
   
   Gemeinsamkeiten von Klassen und Strukturen:
   - Variablen bezeichnet man als Eigenschaften (Properties)
   - beide enthalten sowohl Daten als auch Funktionen (Methoden)
   - beide verwenden Initialisierer, um Variablen innerhalb des Gültigkeitsbereiches in einen gewünschten Zustand zu versetzen
   - beide können Elemente einer Schnittstelle übernehmen (erben)
 
   Aussagen, die nur auf Klassen zutreffen:
   - können Elemente (Eigenschaften und Methoden) von anderen Klassen AUTOMATISCH übernehmen (erben)
   - durch Typüberprüfung (Type Casting) kann man feststellen, von welcher Klasse ein Objekt abgeleitet wurde
   - besitzen neben einem Initialisierer auch einen Deinitialisierer 
 
   Wann sollte man Strukturen, wann Klassen verwenden?
   - eine Struktur sollte man verwenden, wenn nur ein paar simple Typen zusammengefasst werden sollen
   - man sollte immer überlegen, ob die Verwendung eines Referenz-Typs ein Problem bei Übergaben oder Zuweisungen darstellen kann
   - eine Struktur kann immer dann genommen werden, wenn keine Eigenschaften oder Methoden eines anderen Typs benötigt werden
   - Wenn Vererbung im Spiel ist, dann scheiden Strukturen eindeutig aus, da sie nur über Schnittstellen erben können */

// ALLGEMEINES BEISPIEL:

struct Fahrzeug {
    var hersteller: String
    var motorLeistung: Int
    
    init (hersteller: String, motorLeistung: Int) {
        self.hersteller = hersteller                    // "self.hersteller" bezieht sich auf die in struct Fahrzeug definierte Eigenschaft
        self.motorLeistung = motorLeistung              // der rechte Ausdruck ist der von extern übergebene
    }
    
    func getHersteller() -> String {
        return self.hersteller
    }
}

var fahrzeug = Fahrzeug(hersteller: "BMW", motorLeistung: 555)
fahrzeug.getHersteller()


// Code-Beispiel STRUKTUR vs KLASSE:

struct Motor1 {                                             // Struktur als Value Type
    var Typ: String = "Otto"
    var Leistung: Int = 90
}
var meinMotor1 = Motor1()
var nocheinMotor1 = meinMotor1
nocheinMotor1.Typ = "Diesel"
nocheinMotor1.Leistung = 60
print(meinMotor1)
print(nocheinMotor1)

class Motor2 {                                              // Klasse als Reference Type
    var Typ: String = "Otto"
    var Leistung: Int = 90
}
var meinMotor2 = Motor2()
var nocheinMotor2 = meinMotor2
nocheinMotor2.Typ = "Diesel"
nocheinMotor2.Leistung = 60
print(meinMotor2.Typ, meinMotor2.Leistung)
print(nocheinMotor2.Typ, meinMotor2.Leistung)


// value types:                                              // gesetzer Wert wird kopiert, Original bleibt erhalten
var original = "test1"
var kopie = original
kopie = "test2"
print(kopie)
print(original)


struct Test {
    var inhalt: String
}
var originalStruct = Test(inhalt: "teststruct")
var kopieStruct = originalStruct
kopieStruct.inhalt = "test2"

kopieStruct.inhalt
originalStruct.inhalt


// reference types:
class TestClass {
    var inhalt: String = ""
}

var meineClass = TestClass()
meineClass.inhalt = "originalInhalt"

var classKopie = meineClass
classKopie.inhalt = "verändert"
classKopie.inhalt

meineClass.inhalt



public struct Coordinate    // TEST MIT PUBLIC CLASS: init-Methode durch das Schlüsselwort "convenience" ergänzen
{
    public var xValue:Double
    public var yValue:Double
    
    // Die init-Methode erlaubt es, direkt bei der Initialisierung den X- und Y-Wert zu übergeben.
    // Auch in dieser Hinsicht verhalten sich Klassen und Strukturen identisch.
    
    init()
    {
        self.init(x: 0.0,y: 0.0)
    }
    
    init(x:Double, y:Double)
    {
        self.xValue = x
        self.yValue = y
    }
}

// Funktion zu Ausgabe der Koordinatenwerte
public func coordinateOutput(var coord:Coordinate)
{
    coord.yValue += 1.0
    coord.xValue += 1.3
    
    print("X-Wert: \(coord.xValue)")
    print("Y-Wert: \(coord.yValue)")
}

// Coordinate-Struktur erstellen
var location = Coordinate(x: 5.2, y: 4.7)

// Aufruf der Funktion
coordinateOutput(location)
coordinateOutput(location)
coordinateOutput(location)


/* Die Ausgabe ist trotz des "Hochzählens" in der Funktion immer identisch.
   Die Veränderungen gelten nämlich nur im Gültigkeitsbereich der Funktion.
   Weil es sich um eine Struktur handelt, erhält "coordinateOutput" bei jedem
   Aufruf nur eine Kopie der Struktur für den Parameter "coord".
   Werden dort Manipulationen vorgenommen, haben sie keine Auswirkungen auf die
   Struktur "location" außerhalb der Funktion.

   Komplett anders arbeitet das Programm, wenn wir aus "Coordinate" eine Klasse machen.
   Hierzu ändern wir das Schlüsselwort "struct" zu "class" und erweitern die erste init-Methode um "convenience"
   Jetzt haben Änderungen in der Funktion auch Auswirkungen auf die Variable "location",
   denn wenn es sich bei "Coordinate" um eine Klasse handelt, wird nicht länger eine Kopie angelegt.
   Die Fkt. "coordinateOutput" arbeitet mit einer Referenz, einen Verweis auf die Variable "location",
   deren Werte es nur ein Mal gibt.
   Werden xValue und yValue von "coord" manipuliert, erfolgt der Zugriff auf die gleichen Speicherbereiche,
   die von location verwendet werden.



   STRUKTUREN ODER KLASSEN?
   Man kann es auf den ersten Blick nicht immer erkennen, aber viele Typen, mit denen wir bisher gearbeitet haben
   und hinter denen man Klassen erwarten würde, sind Strukturen.
   Zeichenketten, Arrays und Dictionaries sind in Swift mit Absicht Strukturen, denn nur dann werden sie als Wert
   und nicht als Referenz verwendet.
   Das betrifft nicht nur die Übergabe als Parameter bei Funktionen oder Methoden, auch bei jeder Zuweisung wird
   eine Kopie der Instanz angelegt.
   Das folgende Listing kann das eindrucksvoll demonstrieren: */


var s1 = "Hallo Welt"
var s2 = s1
s1 = "Hallo Swift"
print("s1: \(s1) s2: \(s2)")


public class DemoClass
{
    public var text:String = ""
    
    init(txt:String)
    {
        self.text = txt
    }
}
var c1 = DemoClass(txt:"Hallo Welt")
var c2 = c1
c1.text = "Hallo Swift"
print("c1: \(c1.text) c2: \(c2.text)")

// Nach der Zuweisung c2 = c1 verweisen beide Variablen auf dasselbe Objekt
// und eine Änderung an c1 verändert ebenfalls c2.
// c1 und c2 referenzieren denselben Speicherbereich.
// Wurden Klasseninstanzen in der gezeigten Art gleichgesetzt, gehen sie eine Verbindung ein,
// die nur mit großem Aufwand getrennt werden kann.

// Der Einsatz von Strukturen anstelle von Klassen kann in Softwareprojekten zu sicherem Programmcode führen. 
// Weil bei Zuweisungen oder bei Übergaben mit Parametern immer Kopien der Instanzen angelegt werden,
// ist man nicht mehr der Gefahr ausgesetzt, Werte versehentlich an Stellen im Projekt zu ändern, an denen das nicht passieren sollte.

// Einige Entwickler verwenden Methoden, um die Eigenschaften eines Objektes zu setzen.
// Das Objekt wird an die Methode übergeben und dort "gefüllt".
// Ein Rückgabewert ist nicht erforderlich, denn die Methode verwendet eine Referenz auf das Objekt.
// Das nächste Listing zeigt diese Vorgehensweise an einem einfachen Beispiel:


public class DataClass
{
    public var value:String = ""
}

// Die Funktion setzt den Wert der Objektreferenz:
public func setData(data:DataClass)
{
    data.value = "Hallo Swift"
}

// Instanz wird erzeugt
var demo = DataClass()

// Instanz wird an die Funktion übergeben
setData(demo)

// Wert wird ausgegeben
print(demo.value)

// Mit einer Struktur funktioniert das nicht, denn die Funktion erhält nur eine Kopie der Instanz.
// Möchte man weiterhin mit Methoden arbeiten, die in der gezeigten Art funktionieren, sind ein Rückgabewert
// und eine erneute Zuweisung notwendig.


public struct DataStruct
{
    public var value:String = ""
}


// Die Funktion setzt den Wert der Kopie und gibt sie als Rückgabewert zurück
public func setData( var data:DataStruct) -> DataStruct
{
    data.value = "Hallo Swift"
    return data
}

// Instanz wird erzeugt:
var demoStruct = DataStruct()

// Instanz wird an die Funktion übergeben und der Rückgabewert neu zugewiesen:
demoStruct = setData(demoStruct)

// Wert wird ausgegeben:
print(demoStruct.value)

// Strukturen können in Swift einen Großteil der Aufgaben erledigen, der bei anderen Programmiersprachen ausschließlich Klassen
// vorbehalten ist. Den großen Nachteil von Strukturen darf man jedoch nicht verschweigen: Sie können nicht vererbt werden.







