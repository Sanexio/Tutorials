// update: 10.07.16, 12:00

import Cocoa

/*

// METHODEN:
/* 
 Funktionen, die sich innerhalb einer Klasse, Struktur oder Enumeration befinden, werden als Methoden bezeichnet.
 Im Gegensatz zu anderen Sprachen ist es in Swift somit möglich, auch Strukturen oder Enumerationen mit einer Methode zu versehen.
 Es werden zwei Arten von Methoden unterschieden:
 - Instanzmethoden: können nur aufgerufen werden, sobald eine Variable des Typs erzeugt wurde
 - Klassenmethoden: werden direkt in Verbindung mit dem Klassennamen verwendet, ohne dass eine Instanz des Typs erzeugt wurde

   Methoden gehören immer zu einer Klasse, Funktionen hingegen nicht.
   Allerdings wird auch bei Methoden zur Deklaration das func-Schlüsselwort verwendet.
   Methoden haben gegenüber Funktionen einige entscheidende Vorteile:
   Weil sie zu einer Klasse gehören, haben sie vollständigen Zugriff auf sämtliche Eigenschaften der Klasse,
   sogar auf jene, die mit private gekennzeichnet sind.
 
   In Person.swift setzt die Methode getAllPropertiesAsString alle drei Eigenschaften der Klasse zu einem String zusammen.
   Methoden werden innerhalb eines Blocks aus geschweiften Klammern programmiert, der schon die Eigenschaften umschließt.
 
   Eine besondere Methode kommt ohne das Schlüsselwort "func" aus, allerdings muss diese Methode den Namen "init" tragen.
   Sie ist die Methode, die zur Initialisierung einer Klasse verwendet wird und wird automatisch durchlaufen,
   wenn aus der Klasse ein Objekt instanziiert wird.
   Klassen müssen nicht zwangsläufig über eine "init"-Methode verfügen, doch ist diese hervorragend geeignet,
   sämtliche Eigenschaften mit Werten zu initialisieren und die Instanz so in die Startposition zu bringen.
 
   Die "init"-Methode nimmt Parameter entgegen und kann diese bei der Instanziierung der Eigenschaften zuweisen.
   Durch die Verwendung von "self" ist es sogar möglich, für die Parameter und die Eigenschaften die gleichen Namen zu verwenden.
   Der Compiler kann erkennen, ob ein Parameter oder eine Eigenschaft gemeint ist:


        init(firstName: String, lastName:String, age:Int)
        {
            self.firstName = firstName
            self.lastName = lastName
            self.age = age
        }

   FAILABLE INITIALIZERS:
   Failable-Initializer sind Methoden zur Initialiserung, die fehlschlagen können.
   Bspw. könnten wir die Klasse um eine init-Methode erweitern, bei der das Alter der Person
   als Zeichenkette übergeben werden kann.
   Der String muss dann in den Int-Typ der Eigenschaft umgewandelt werden.
   Diese Konvertierung kann misslingen, wenn es sich bei dem Text nicht um eine Zahl handelt.

        convenience init(firstName: String, lastName: String, age: String)
        {
            var ageIntValue = 0
            
            if let convertedValue = age.toInt()     // Den übergebenen String-Parameter
            {                                       // in einen Int-Wert umwandeln.
                ageIntValue = convertedValue
            }
            
            self.init(firstName: firstName, lastName: lastName, age: ageIntValue
        }

   In der gezeigten Methode wird der Person ein Alter von Null Jahren zugewiesen,
   wenn die übergebene Zeichenkette nicht erfolgreich in einen Int umgewandelt werden kann.
   Trotzdem erhält man eine gültige Instanz.
   Soll bei einer erfolglosen Umwandlung die gesamte Objektinstanziierung fehlschlagen,
   muss man Failable-Initializer verwenden.
   Der Methodenname "init" wird um ein Fragezeichen erweitert, durch das sofort ersichtlich wird,
   dass die Methode auch ein nil zurückgeben kann:

        convenience init?(firstName: String, lastName: String, age: String)
        {
 
            if let convertedValue = age.toInt()     // Umwandling erfolgreich,
            {                                       // Designated-Initializer aufrufen.
 
                self.init(firstName: firstName, lastName: lastName, age: convertedValue)
            }
 
            else
            {
            
            // Alle Eigenschaften müssen initialisiert werden, auch wenn die Methode nil zurückgibt.
 
            self.init(firstName:"", lastName:"", age: 0)
            return nil
            }
 
        }

   Jetzt haben wir es mit einem Personal-Optional zu tun und bevor wir mit dem Objekt arbeiten können,
   muss geprüft werden, ob es korrekt instanziiert wurde.
   Dann können wir den Optional auf bekannte Art mit dem Ausrufezeichen auspacken:

        var kevin = Person(firstName: "Kevin", lastName: "Klein", age: "20")
 
           if kevin != nil
           {
                println(kevin!.getAllPropertiesAsString())
           }

   METHODEN ZUR DEINITIALISIERUNG:
   Es gibt Situationen, die nicht durch das ARC (Automatic-Reference-Counting) abgedeckt werden.
   ARC ist ein System für die Speicherverwaltung, welches die nötigen Befehle vom Compiler direkt in das Programm lädt.
   Wird allerdings durch eine Objektinstanz eine Datei auf der Festplatte geöffnet,
   liegt es auch in der Verantwortung des Objektes, diese Verbindung wieder zu schließen,
   wenn die Instanz nicht länger benötigt wird und ihr Speicherplatz freigegeben werden soll.
   Andernfalls kann es zu Dateninkonsistenz kommen, oder das Betriebssystem wird vermuten,
   die Datei wäre weiterhin in Verwendung.
   Für solche und ähnliche Aufgaben eignen sich "deinit"-Methoden, die ebenfalls nicht zwingend implementiert werden müssen.
   Die Definiton einer "deinit"-Methode ist sehr einfach:

        deinit
        {
            println("Instanz soll aus dem Speicher entfernt werden.")
        }
 
   Bei unserer Klasse "Person" werden sämtliche angelegte Objekte erst dann nicht mehr benötigt,
   wenn das Programm endet.
   Hier wird der Speicherplatz der gesamten Anwendung vom Betriebssystem freigegeben
   und nicht einzeln für jedes Objekt.

   KLASSENMETHODEN:
   Die Aussage, Klassen wären nur Baupläne und enthielten keinen ausführbaren Code, ist nicht korrekt.
   Es besteht die Möglichkeit, die Methoden einer Klasse, und nicht eines Objektes, auszuführen.
   Allerdings nur, wenn es sich dabei um Klassenmethoden (Type-Methods) handelt.
   Andere Programmiersprachen verwenden die Bezeichnung "Statische Methoden".
   Die Definition einer Klassenmethode unterscheidet sich nur wenig von den Methoden,
   die wir bereits kennen und die im Unterschied zu den "Type-Methods"
   als "Instance-Methods" bezeichnet werden.
   Die Methode muss vor dem Schlüsselwort "func" um ein "class" erweitert werden.

        class func Info() -> String
        {
            return "Ich bin eine Klassenmethode!"
        }

   Um die Methode auszuführen, muss kein Objekt erzeugt werden, denn der Aufruf geht direkt an die Klasse.
   Dabei kann auch die Punktnotation verwendet werden, jetzt aber mit dem Klassennamen
   statt des Namens der Instanz: print(Person.Info())

   Auf die Eigenschaften der Klasse kann aus einer Klassenmethode nicht zugegriffen werden,
   denn diese sind Instanzvariablen und benötigen eine Instanz.
   Andere Methoden der Klasse können ebenfalls nicht aufgerufen werden, es sei denn,
   es handelt sich um andere Klassenmethoden.
   Beim Aufruf wird dann nicht "self", sondern der Klassenname verwendet.
   Klassenmethoden können ebenfalls privat sein.

   Aufruf einer privaten Klassenmethode:

        class func Info() -> String
        {
            return Person.Info2()
        }
 
        private class func Info2() -> String
        {
            return "Ich bin auch eine Klassenmethode!"
        }

   Klassenmethoden kommen oft zum Einsatz, um neue Instanzen ihrer Klasse zu erzeugen,
   bei denen die Eigenschaften zusätzlich auf genau definierte Werte gesetzt werden.
   Bei der Klasse Person ist das einfach, aber die Instanziierung eines Objektes mit vielen Eigenschaften
   ist zweifellos umfangreicher. */

// INSTANZMETHODEN:

class Kilometerzähler {
    var zähler: Double = 0
    
    func addKilometer() {
        zähler += 1
    }
    
    func zählerLöschen() {
        zähler = 0
    }
    
    func addKilometerByValue(kilometer1:Double, kilometer2:Double) {
        zähler += kilometer1
        zähler += kilometer2
    }
}

var kmz = Kilometerzähler()
kmz.addKilometerByValue(20.0, kilometer2:0.5)

// MUTATING !
// Methoden innerhalb von Strukturen:
// Strukturen und Enumerationen sind selbst Value-Typen und prinzipiell nicht durch Instanzmethoden veränderbar.
// Durch das Schlüsselwort "mutating" ist dies dann doch möglich.

struct Kilometerzaehler {
    var zaehler: Double = 0
    
    mutating func addKilometer() {
        zaehler += 1
    }
    
    mutating func zählerLöschen() {
        zaehler = 0
    }
    
    mutating func addKilometerByValue(kilometer1:Double, kilometer2:Double) {
        zaehler += kilometer1
        zaehler += kilometer2
    }
}

var kilometer = Kilometerzaehler()
kmz.addKilometerByValue(15.0, kilometer2:3.5)



// KLASSENMETHODEN:
// Methoden, die ausschließlich über den Typ selbst aufgerufen werden.
// Die Erstellung eines Objekts ist nicht notwendig.

class KILOMETERZÄHLER {
    class func berechneDifferenzPunktA(A:Int, punktB:Int) -> Int
    {
        var result = 0
            result = A - punktB
            return result
    }
}
var result = KILOMETERZÄHLER.berechneDifferenzPunktA(20, punktB: 10)
// Die Methode lässt sich aufrufen, ohne zuvor eine Variable der Klasse zu erzeugen.
// Das ist immer dann praktisch, wenn man eigentlich keine Instanz der Klasse benötigt,
// weil bspw. nur eine Berechnung durchgeführt werden soll, ohne dass das Ergebnis im 
// Anschluss in einer Eigenschaft gespeichert werden muss.



// STATIC !
// Klassenmethoden können auch innerhab einer Struktur oder Enumeration implementiert werden.
// Logischerweise kann hier nicht das Schlüsselwort "class" vor dem Schlüsselwort "func" 
// verwendet werden. Hier wird das Schlüsselwort "static" zur Kennzeichnung verwendet:

struct Zaehler {
    static func berechneDifferenzPunktA(punktA:Int, punktB:Int) -> Int
    {
        var result = 0
        result = punktA - punktB
        return result
    }
}



// Parameter und Initialisierer:
class KilometerZähler {
    var zähler: Float
    
    init(entfernungInKilometer kilometer: Float) {
        zähler = kilometer * 1000
    }
    
    init(entfernungInMeter meter: Float) {
        zähler = meter
    }
}

var KMZ = KilometerZähler(entfernungInKilometer: 1)
print(KMZ.zähler)
// In den init-Methoden sind "entfernungInKilometer" und "entfernungInMeter" Parameter,
// die auch von extern aufgerufen werden können, während "kilometer" und "meter" nur
// intern Verwendung finden.



// SELF !
// Bei Verwendung des gleichen Namens für Variable und Parameter kann das Schlüsselwort "self" verwendet werden:
class KILOmeterzähler {
    var zähler: Float
    
    init(zähler:Float) {
        self.zähler = zähler
    }
}
var kMz = KILOmeterzähler(zähler: 1000)
print(kMz.zähler)


*/


// Externe Parameter:

class MeineMeetings {
    var meetings = [String: String]()
    
    func neuesMeeting(mit name: String, um uhrzeit: String) {
        meetings[uhrzeit] = name
    }
}
var meetMe = MeineMeetings()
meetMe.neuesMeeting(mit: "mir", um: "07:00")


// Mutating Functions:

struct MeineMeetings2 {
    var meetings2 = [String: String]()
    
    mutating func neuesMeeting2(mit name: String, um uhrzeit: String) {
        meetings2[uhrzeit] = name
    }
}
var meetMe2 = MeineMeetings2()
meetMe2.neuesMeeting2(mit: "mir", um: "07:00")

// Type Methods (statische Methoden):

class HttpError {
    class func notFoundError() {
        "404-notfound"
    }
}
HttpError.notFoundError()