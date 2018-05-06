// update: 08.07.2016, 13:00

import Cocoa

/* KLASSEN:
   Definition: Zusammenfassung gleichartiger Objekte
   Legt fest, welche grundlegenden Eigenschaften die Objekte haben und welche Methoden aufgrund einer Nachricht ausgeführt werden.
   Bei Start des Programms liest der Compiler diese Beschreibung aus und erkennt die Klasse, also den Bauplan des jeweiligen Objektes.
   Damit erhält die Klasse selbst eine Nachricht der Art "Erzeuge mir ein Objekt nach dem bei dir gespeicherten Bauplan".
   Somit ist die Klasse selbst wieder ein Objekt, da ja Objekte Empfänger von Nachrichten sind.
   Und es muss bei der Klasse also auch eine entsprechende Methode vorhanden sein, die bei jeder Nachricht ein neues Objekt erzeugt.
   Und so ist es auch: Jede Klasse wird gleichzeitig durch ein sogenanntes Klassenobjekt repräsentiert.
   Dieses Klassenobjekt ist bei Start des Programms einfach da, muss also nicht erst erzeugt werden.
   Allerdings haben Klassenobjekte einen Nachteil: Man kann in ihnen keine Daten speichern.


   INSTANZEN:
   Um das Ganze unterscheiden zu können, werden die von den Klassen erzeugten Objekte "Instanzobjekte" oder kurz "Instanzen" genannt.
   Somit gilt: KLASSE meint den TYP eines INSTANZOBJEKTES, während das KLASSENOBJEKT den Empfänger einer Nachricht meint.
   Aus einer Klasse können beliebig viele Objekte erzeugt werden.
   Die Variablen einer Klasse werden Instanzvariablen oder Eigenschaften genannt.
   Eigenschaften können unabhängig voneinander in jeder Instanz einer Klasse verwendet werden.
   Daher beanspruchen sie alle eigenen Speicherplatz.
   Die Anzahl der möglichen Instanzen einer Klasse werden oftmals nur durch den freien Arbeitsspeicher des Gerätes begrenzt.
   Instanzen einer bestimmten Klasse können in der Datei main.swift angelegt werden.
   Dieselbe Nachricht kann in Abhängigkeit vom Empfänger zu verschiedenen Methoden führen. Dies bezeichnet man als »Polymorphie«.
   Zugriff auf die Eigenschaften: Objektinstanzname.Variablenname.
   Diese Schreibweise wird Punktnotation genannt und ist in vielen Programmiersprachen üblich.
   Hat eine Eigenschaft selbst weitere Eigenschaften, kann auf diese in gleicher Art zugegriffen werden.
   Man fügt also mit einem weiteren Punkt getrennt den Namen der Eigenschaft an.

   Im Code wird über das Schlüsselwort "public" signalisiert, dass eine Variable von außerhalb einer Klasse verwendet werden kann.
   Variablen, die nur Gültigkeit innerhalb der Klasse besitzen, werden mit "private" deklariert.
   Enthält eine Swift-Klasse öffentliche Variablen, muss zusätzlich die komplette Klasse mit "public" deklariert werden.
   Verwendet man weder "public" noch "private", werden Variablen und Klasse automatisch als "internal" deklariert.
   Mit dieser Einstellung ist nur innerhalb einer Anwendung oder eines Frameworks ein Zugriff von außen möglich.
   Bei der Entwicklung wiederverwertbarer Bibliotheken müssen alle öffentlichen Schnittstellen mit "public" deklariert sein.

   Bei den Eigenschaften einer Klasse muss es sich nicht zwangsläufig um Variablen handeln.
   Manchmal ist es sinnvoller, einen Wert erst zu generieren, wenn die Eigenschaft abgefragt wird.
   Andernfalls müsste die Eigenschaft der Klasse immer aktualisiert werden, sobald sich Werte ändern, was mit unnötiger Arbeit verbunden wäre.
   Solch eine berechnete Eigenschaft wird in Swift "Computed Property" genannt.

   GETTER UND SETTER
   Eine Zugriffsfunktion, auch Zugriffsmethode, Akzessor oder im Programmiererjargon getter und setter genannt,
   ist in der objektorientierten Programmierung eine spezielle Methode, die eine einzelne Eigenschaft eines Objekts abfragt oder ändert.
   Sie sind Teil der öffentlichen Schnittstelle eines Objekts und verbergen Implementierungsdetails dieses Objekts.
   Dadurch kann die Implementierung eines Objekts geändert werden, ohne seine öffentliche Schnittstelle zu ändern.
   Eine Zugriffsmethode, die eine Eigenschaft eines Objekts abfragt, heißt auch Abfragemethode oder GETTER.
   Die Eigenschaft kann entweder direkt aus einem Objektattribut entnommen, das dann normalerweise eine geringere Sichtbarkeit hat,
   oder im Moment des Aufrufs berechnet werden. Für den Aufrufer ist das nicht erkennbar, dadurch wird die Kapselung sichergestellt.
   Eine Zugriffsmethode, die ein Objektattribut ändert, heißt auch Änderungsmethode oder SETTER.
   Ein Vorteil der Änderungsmethode besteht darin, dass sie vor der Änderung den Wert auf Gültigkeit prüfen kann. 
   So könnte beispielsweise in einem Objekt, das eine Person darstellt, die Funktion zum Setzen des Namens sicherstellen, 
   dass als Name kein leerer Text übergeben wird.
   Falls ein ungültiger Wert übergeben wird, besteht eine mögliche Reaktion im Auslösen einer Ausnahmeroutine, 
   wodurch der normale Programmablauf unterbrochen und ein Fehler signalisiert wird.

   Durch die Möglichkeit, in Gettern und Settern mit beliebigen Anweisungen programmieren zu können, lassen sich Klassen flexibel gestalten. */


class Fahrzeug {
    var name: String = ""
    var farbe: String = ""
    var geschwindigkeit: Int = 0
    
    func beschleunigen(neueGeschwindigkeit: Int) {
        geschwindigkeit = neueGeschwindigkeit
    }
    
    func bremsen() {
        geschwindigkeit = 0
    }

    func getGeschwindigkeit() -> Int {
        return geschwindigkeit
    }
    
    init(name: String, farbe: String, speed: Int) {
        self.name = name
        self.farbe = farbe
        self.geschwindigkeit  = speed
    }
}

class Fahrrad: Fahrzeug {                                       // Klasse Fahrrad erbt alle Eigenschaften der Klasse Fahrzeug
    var istStänderHochgeklappt = true
    
    func ständerHochklappen() {
        istStänderHochgeklappt = true
    }
    
    func ständerRunterklappen() {
        istStänderHochgeklappt = false
    }
}

class Auto: Fahrzeug {
    var ps: Int = 0
}

var rad = Fahrrad(name: "BMW", farbe: "orange", speed: 0)       // Instanz von Fahrrad erzeugen
rad.ständerHochklappen()

var auto = Auto(name: "BMW", farbe: "schwarz", speed: 0)        // Instanz von Auto
auto.ps





 
 class Person
 {
    private var nachname = ""
    private var vorname = ""
    private var personalNummer = 0
 
 var outNachname: String
 {
    get {return nachname}
    set { nachname = newValue }
 }
 
 var outVorname: String
 {
    get {return vorname}
    set { vorname = newValue }
 }
 
 var outPersonlnummer: Int
 {
    get {return personalNummer}
    set
    {
        if (newValue > 0) {
            personalNummer = newValue
        } else {
            print("Keine gültige Nummer!")
        }
    }
 }
 }
 
 var person = Person()
 person.nachname = "Stracke"
 person.vorname = "Siegbert"
 person.personalNummer = 1
 
 print(person.personalNummer)
 print(person.nachname)
 print(person.vorname)
 
   /* Eigenschaften sollten immer initialisiert werden. D.h., ihnen sollte zu Beginn des Programms ein Wert zugewiesen werden.
   Manchmal ist das aber aus unterschiedlichen Gründen nicht möglich oder nicht gewollt, bspw. wenn der Wert der Eigenschaft
   von außen gesetzt wird. In solchen Fällen muss man die entsprechende Eigenschaft gesondert kennzeichnen.
   Hierfür wird das Schlüsselwort "lazy" verwendet. */

        class a {
        }
        class b {
            lazy var lazyVar = a()
        }

   /* Im o.g. Bsp. wird innerhalb der Klasse b eine lokale Instanz der Klasse a abgelegt - und dies erst zur Laufzeit.
   Die Initialisierung findet somit nicht unmittelbar statt. Durch Verwendung des Schlüsselwortes "lazy" wird deutlich,
   das die Variable lazyVar nicht unmittelbar initialisiert werden muss, sondern dass sie erst unmittelbar vor dem
   ersten Gebrauch initialisiert wird. */


// PROPERTY OBSERVER:
/* Mit einem Property-Observer lassen sich zwei Zeitpunkte überwachen. 
   Der erste tritt ein, unmittelbar bevor der Eigenschaft ein Wert zugewiesen wird (willSet).
   Sobald ein Wert zugewiesen wurde (didSet), ist der zweite Zeitpunkt erreicht, zu dem ein Property Observer ausgelöst werden kann. */

/*
class Person2
{
    privat var Nachname: String = ""
        {
            willSet(newLastName) {
                print("Neuer Name: + newLastName wird geprüft..." )
            }
            didSet {
            print("Der neue Name wurde gespeichert.")
            }
        }
}
*/






