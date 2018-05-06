import UIKit
/*
   Alle objektorientierten Programmiersprachen besitzen die Möglichkeit,
   die Eigenschaften und Methoden einer Klasse an eine andere Klasse zu vererben.
   Es können nur Elemente vererbt werden, die entweder als public gekennzeichnet sind
   oder deren (Ursprungs-) Klasse sich in demselben Modul (Zugriffsmodifizierer internal)
   befindet, d.h. zusammen mit der erbenden Klasse. Elemente einer Klasse, die mit private
   gekennzeichnet sind, können nicht vererbt werden. */

// INITIALISIEREN UND ÜBERSCHREIBEN:

// Überschreiben von Methoden:

class Käfer {
    var name: String
    init(name: String) {                // Standardinitialisierer: erwartet als Parameter den Namen eines neuen Käfers.
        self.name = name                // Weitergabe des Parameters an die Eigenschaft "name" der Klasse.
    }
    convenience init() {                // Convenience-Initialisierer: erwartet keinen Parameter
        self.init(name: "[Kein Name]")  // intern wird der Eigenschaft "name" ein Standardwert zugewiesen
    }
}
class SpezialKäfer: Käfer {
    var gewichtInGramm: Int
    init(name: String, gewichtInGramm: Int) {
        self.gewichtInGramm = gewichtInGramm
        super.init(name: name)          // Initialisierer der Superklasse wird aufgerufen
    }                                   // Code der Superklasse wird ausgeführt
    override convenience init(name:String) {
        self.init(name: name, gewichtInGramm:  10)
    }
}

var bug = Käfer(name: "Kleiner Käfer")
print(bug.name)

var bugOhneName = Käfer()
print(bugOhneName.name)

var spezialBug = SpezialKäfer(name: "Maikäfer", gewichtInGramm: 1)
print(spezialBug.name, spezialBug.gewichtInGramm)

var spezialBUG = SpezialKäfer(name: "Marienkäfer")  // hier greift die override-Funktion der Klasse Spezialkäfer !
print(spezialBUG.name, spezialBUG.gewichtInGramm)


// Überschreiben von Eigenschaften:

class Person
{
    private var personalnummer = 0
    
    var Personalnummer: Int {
        get { return personalnummer }               // Eigenschaft nur lesend implementiert
    }
}
var person = Person()
// person.Personalnummer = 123                         Fehler, da "Personalnummer" get-only-property

class Mitarbeiter: Person {
    override var Personalnummer: Int {
        get { return super.personalnummer }         // Rückgriff in die Basisklasse mit "super" funktioniert auch
        set {
            personalnummer = newValue
        }
    }
}
var mitarbeiter = Mitarbeiter()
mitarbeiter.Personalnummer = 123
print(mitarbeiter.Personalnummer)

// MERKE: Mit dem Schlüsselwort "final" lassen sich Eigenschaften und Methoden kennzeichnen,
// die NICHT überschrieben werden sollen!



   /* Die Vererbung ist jedoch nicht der einzige Weg, bestehenden Programmcode
   um zusätzliche Fähigkeiten zu erweitern.
   Eine Alternative bieten in vielen Situationen Assoziationen, die eine ganz
   andere Art von Beziehung zwischen den Objekten ermöglichen.
   Hier wird ein Objekt zu einer Eigenschaft eines anderen Objektes.

   Bei der Entwicklung der Klasse "Employee" können die Eigenschaften
   der Klasse Person übernommen werden, da die Attribute Vorname, Name und Alter
   sicherlich auch Eigenschaften von Angestellten sind.

   Es ist daher ratsam, beim Entwurf der Klasse "Employee" die Eigenschaften der
   Klasse Person zu übernehmen. Es gibt verschiedene Wege, das zu tun:

   Man kann den Programmcode aus der bestehenden Klasse "Person" kopieren und
   in der Klasse Employee einfügen.
   Diese hätte mit der ursprünglichen Klasse "Person", außer den identischen
   Bezeichnern, nichts mehr gemeinsam.

   Man kann mit "Vererbung" arbeiten.
   So erhält man eine Klasse Employee, die sämtliche Eigenschaften und Methoden
   von Person übernimmt, zusätzlich aber mit eigenem Code erweitert werden kann.
   Wird zu einem späteren Zeitpunkt "Person" erweitert, bspw. um den Geburtstag,
   steht die Eigenschaft automatisch auch in der Klasse "Employee" zu Verfügung.

   Um von der Klasse Person erben zu können, muss sie im aktuellen Projekt
   vorhanden sein. Die Daten Person.swift kann direkt aus dem Finder in den
   Project-Navigator gezogen werden.
   Für die Klasse Employee wird eine neue leere Swift-Datei erzeugt.

   Um die Klasse "Person" zur Elternklasse von Employee zu machen,
   ist es ausreichend, ihren Namen in der Klassendeklaration anzugeben,
   wobei die beiden Namen durch einen Doppelpunkt getrennt werden.
   Der in anderen Programmiersprachen oft benötigte Import der Elternklasse
   ist bei der Arbeit mit Swift nicht erforderlich. */

public class AddressData
{
    public var street:String
    public var zipCode:String
    public var city:String
    
    convenience init()
    {
        self.init(street:"", zipCode:"", city:"")
    }
    
    init(street:String, zipCode:String, city:String)
    {
        self.street = street
        self.zipCode = zipCode
        self.city = city
    }
}

public class Person
{
    public var firstName:String
    public var age:Int
    public var lastName:String
    public var address:AddressData?  // Deklaration der Eigenschaft address als Optional
    
    convenience init()
    {
        self.init(firstName:"Max", lastName:"Müller",age:32)
    }
    
    // Eine Methode, die sämtliche Parameter als Zeichenketten entgegennimmt:
    convenience init?(firstName:String,
                      lastName:String, age:String)
    {
        if let convertedValue = Int(age)
        {
            // Umwandlung erfolgreich,
            // Designated-Initializer aufrufen
            self.init(firstName:firstName,
                      lastName:lastName ,age:convertedValue)
        }
        else
        {
            // Alle Eigenschaften müssen initialisiert werden,
            // auch wenn die Methode nil zurück gibt
            self.init(firstName:"", lastName:"",age:0)
            return nil
        }
    }
    
    
    init(firstName:String, lastName:String, age:Int)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        // self.address = AddressData()
    }
    
    // Das Alter der Person in Tagen
    // (Vereinfachte Berechnung)
    public var ageInDays:Int
        {
        // Getter um den Wert zu lesen
        get { return self.age * 365}
        // Setter um den Wert zu schreiben
        set (days)
        {
            if days < 0
            {
                self.age = 0
            }
            else
            {
                self.age = days / 365
            }
        }
    }
    
    func getAllPropertiesAsString() -> String
    {
        // Hier wird die private Methode aufgerufen
        return self.getNameProperties()
            + " Ich bin \(self.age) Jahre alt."
    }
    
    // Eine private Methode
    private func getNameProperties() -> String
    {
        return "Mein Name ist \(self.firstName) " +
            "\(self.lastName)."
    }
    
    deinit
    {
        print("Instanz soll aus dem Speicher entfernt werden.")
    }
    
    // Eine einfache Factory-Methode
    // für die Klasse Person
    class func getDefaultInstance() -> Person
    {
        let pers = Person()
        pers.firstName = "Max"
        pers.lastName = "Müller"
        pers.age = 32
        return pers
    }
    
    // kopierten Eigenschaften anzulegen
    class func copyFrom(_ original:Person) -> Person
    {
        let persCopy = Person()
        persCopy.firstName = original.firstName
        persCopy.lastName = original.lastName
        persCopy.age = original.age
        return persCopy
    }
}


        public class Employee : Person
        {
 
        }

   /* Schon nach dieser kleinen Erweiterung verfügt die Klasse "Employee" über
   alle Eigenschaften und Methoden ihrer Elternklasse.
   Mit ein paar Zeilen Code kann man dies in der Datei main.swift testen: */

        let karl = Employee()
        karl.age = 43
        karl.firstName = "Karl"
        karl.lastName = "Lehmann" 
        print(karl.getAllPropertiesAsString())

   /* Hiermit kann problemlos auf alle Eigenschaften und Methoden zugegriffen werden,
   denn für eine erzeugte Instanz ist es unerheblich, ob ihre Eigenschaften und
   Methoden von der Elternklasse oder der Kindklasse kommen.

   Zusätzliche Erweiterungen für die abgeleitete Klasse "Employee" können auf die
   bekannte Art programmiert werden, denn für eine erzeugte Instanz ist es
   unerheblich, ob ihre Eigenschaften und Methoden von der Elternklasse
   oder der Kindklasse kommen.
   Wir können "Employee" um die Eigenschaften Gehalt und Abteilung erweitern: */

        public class EMployee : Person
        {
            public var salary:Double = 0.0
            public var department:String = ""
 
        }

   // ____________________________________________________________________________________________________________

        public class EMPloyee : Person
        {
            public var salary:Double
            public var department:String
    
            convenience init()
            {
                self.init(firstName:"Astrid", lastName:"Müller",age:18)
            }
    
            // Der Designated-Initialier der Elterklasse wird überschrieben
            override init(firstName:String, lastName:String, age:Int)
            {
                self.salary = 25000
                self.department = "Marketing"
                super.init(firstName:firstName, lastName:lastName, age:age)
            }
        }

   // Im Programm macht es keinen Unterschied, ob eine Klasse eine Eigenschaft erbt oder sie selbst implementiert:

        let fritz = EMPloyee()
        fritz.age = 43
        fritz.firstName = "Karl"
        fritz.lastName = "Lehmann"
        fritz.salary = 12500
        fritz.department = "Verkauf"
 
        print(fritz.getAllPropertiesAsString())
        print("Gehalt: \(fritz.salary)")
        print("Abteilung: \(fritz.department)")


// METHODEN VERERBEN:
// Nicht nur Eigenschaften, sondern auch Methoden werden vererbt.
// Im Fall der Klasse "Person" die Methode "getAllPropertiesAsString".
// Sie kann für Objekte verwendet werden, die von der abgeleiteten Klasse instanziiert werden.
// Sollen nun zusätzliche Informationen, wie z.B. "Abteilung" und "Gehalt" ausgegebn werden, 
// wenn "getAllPropertiesAsString" aufgerufen wird, benötigt die Klasse "Employee" eine eigene
// Methode, mit exakt der gleichen Signatur, welche die Methode der Elternklasse bei einem Aufruf ersetzt.
// Die geerbte Methode wird dann überschrieben.
// Im Code erreicht man dies durch das Schlüsselwort "override":


        /* override func getAllPropertiesAsString() ->String
        {
            var allProps:String
 
                = "Mein Name ist \(self.firstName) \(self.lastName)"
                + "Ich bin \(self.age) Jahre alt."
                + "\nIch arbeite in Abteilung \(self.department)."
                + "\nIch verdiene \(self.salary)."
 
            return allProps
        } */

// Sämtliche Zugriffe auf die Eigenschaften können weiterhin über "self" laufen,
// auch wenn sie in der Elternklasse deklariert wurden.

// Alternativ ist es auch möglich, die Methode aus der Elternklasse von "Employee" aus aufzurufen und sie
// einen Teil der Zeichenkette bilden zu lassen.
// Mit "super" als Objekt kann von der Kindklasse eine Methode der Elternklasse aufgerufen werden:

        /* override func getAllPropertiesAsString() ->String
        {
            var allProps:String
 
                = super.getAllPropertiesAsString()                          // Aufruf der Elternklasse mit super
                    + "\nIch arbeite in Abteilung \(self.department)."
                    + "\nIch verdiene \(self.salary)."
 
            return allProps
        } */

// Dies ist ein typisches Bsp. einer überschriebenen Methode.
// Obwohl die Klasse "Employee" die Methode "getAllPropertiesAsString" neu implementiert,
// kann von dort aus die gleichnamige Methode der Elternklasse "Person" aufgerufen werden.
// Im Anschluss werden die zusätzlichen Eigenschaften von "Employee" der Zeichenkette angehängt.

// Wenn im o.g. Bsp. die Anweisungen vertauscht werden, hat dies nur eine andere Reihenfolge bei der Ausgabe
// zur Folge, die Auswirkungen können in anderen Fällen durchaus schwerwiegender sein.

        /* override func getAllPropertiesAsString() ->String
        {
            var allProps:String
                
                + "\nIch arbeite in Abteilung \(self.department)."
                + "\nIch verdiene \(self.salary)."
                = super.getAllPropertiesAsString()                          
 
            return allProps
        } */


// INITIALISIERUNG ABGELEITETER KLASSEN:
// Eine Situation, bei der die Aufrufe von der Kind- an die Elternklasse keinesfalls vertauscht werden dürfen,
// betrifft die Initialisierung der Klasse.
// Die "init"-Methoden benötigen eine festgelegte Reihenfolge der Aufrufe, und in Swift müssen die Eigenschaften
// der eigenen Klasse immer zuerst initialisiert werden.
// Erst dann ist ein Aufruf an die Superklasse erlaubt.
// In Objective-C läuft dieser Vorgang in der genau umgekehrten Reihenfolge ab.
// Dort muss die Initialisierung der Elternklasse erfolgreich durchlaufen werden, bevor die Variablen der 
// Kindklasse gesetzt werden können.

        /* public class Employee : Person
        {
            init()         // Initialisierung der Eigenschaften der Kindklasse mit einem anschließenden Aufruf der Elternklasse
            
            self.salary = 25000
            self.department = "Marketing"
            super.init(firstName: "Astrid", lastName: "Müller", age: 18)
        }
 
        public var salary: Double
        public var department: String */

// Ist die init-Methode geschrieben, werden alle neuen Employee-Objekte mit "Astrid Müller" initialisiert.

// Objekt-Instanz und die Standardwerte ausgeben:

        /* var astrid = Employee()
        print(astrid.getAllPropertiesAsString()) */

// Nacharbeiten: Seite 211 - 214


// ASSOZIATIONEN - Beziehungen zwischen Objekten
// Der Klasse "Person", und somit auch der Klasse "Employee" soll nun die Fähigkeit verliehen werden,
// eine Adresse zu verwalten. Allerdings soll dies nicht durch mehrere zusätzliche Eigenschaften umgesetzt werden,
// sondern durch eine einzelne Eigenschaft, für die wir eine Klasse mit dem Namen "AdressData" entwickeln.
// "AdressData" erhält die Details der Anschrift.
// Die Klasse "Person" erhält im Anschluss eine weitere Eigenschaft, um zusätzlich ein Objekt vom Typ
// "AdressData" verwalten zu können. Diese Art von Beziehung zwischen zwei Objekten wird als Assoziation bezeichnet.

// Um die Nutzung zu vereinfachen, erhält die Klasse eine init-Methode, mit der für alle drei Eigenschaften Werte übergeben
// werden können, sowie einen Convenience-Initializer, der keine Parameter benötigt.

        /* public class AddressData
        {
            public var street:String
            public var zipCode:String
            public var city:String
 
            convenience init()
            {
                self.init(street:"", zipCode:"", city:"")
            }
 
            init(street:String, zipCode:String, city:String)
            {
                self.street = street
                self.zipCode = zipCode
                self.city = city
            }
        } */

// Mit einer unabhängigen Klasse für die Adressdaten können wir Klassen um eine Adresse erweitern,
// die nicht von "Person" abgeleitet sind. Zum Bsp. Behörden oder Firmen, die zwar einen Standort haben,
// aber keinen Personen -Namen oder -Vornamen benötigen.
// In der Softwareentwicklung bezeichnet man die Beziehungen einer Assoziation als "has-a" (hat eine),
// während Vererbung eine "is-a" (ist-eine) Beziehung darstellt.
// Ein Angestellter "ist-eine" Person, aber "hat-eine" Adresse.
// Oftmals sind Assoziationen aufwendiger zu entwickeln, aber flexibler in der Handhabung.
// Wären sämtliche Adressdaten Eigenschaften der Klasse "Person", wäre eine Wiederverwendbarkeit nicht möglich.
// Zusätzlich wären alle Personen gezwungen, über eine Adresse zu verfügen. Hätte eine Person keinen Wohnsitz,
// bestünde die einzige Möglichkeit darin, säntliche Adressdaten mit einer leeren Zeichenkette zu füllen.

// In der Klasse "Person" bieten sich verschiedene Wege an, um aus der Klasse "AddressData" die Eigenschaft
// "address" zu machen, um sie zu initialisieren.
// Wie auch bei anderen Datentypen kann einer Instanzvariablen schon bei der Deklaration ein Wert zugewiesen werden.
// In diesem Fall ist der Wert eine Instanz der Klasse "AddressData", bei der durch den Convenience-Initializer der
// Klasse "AddressData" alle Eigenschaften auf leere Zeichenketten gesetzt werden.
// Für die Eigenschaft "address" muss auch ein Wert gesetzt werden, andernfalls gibt der Compiler einen Fehler aus:

        /* public class Person
        {
            // Definition und Deklaration der Eigenschaft address:
            
            public var address: AddressData = AddressData()
 
        ... } */

// Alternativ kann man auf eine Zuweisung bei der Deklaration verzichten und sie stattdessen im
// Desgnated-Initializer von Person vornehmen, denn diese Methode wird bei der Instanziierung durchlaufen:


        /* public class Person
        {
            // Deklaration der Eigenschaft address. Die Zuweisung geschieht in der init-Methode
 
            public var address: AddressData
 
                 init(firstName: String, lastName: String, age: Int)
                 {
                      self.firstName = firstName
                      self.lastName = lastName
                      self.age = age
                      self.adress = AddressData()
                 }
 
            .... */

// Soll eine neue Instanz mit anderen Adressdaten erstellt werden, kann stattdessen der Designated-Initializer der Klasse
// AddressData verwendet werden. Straße, PLZ und Ort werden dort als Parameter übergeben.

        /* ....
            self.address = Address(street: "Meisebacherstraße", zipCode: "36251", city: "Bad Hersfeld")
        .... */

// Eine andere Möglichkeit besteht darin, aus address einen Optional zu machen.
// Jetzt ist keine Zuweisung innerhalb der Klasse Person mehr erforderlich, denn nil ist ein legitimer Wert für address.
// Eine Person muss nicht mehr zwingend eine Adresse haben.

        /* public class Person
        {
            // Deklaration der Eigenschaft address als Optional
            
            public var address: AddressData?
 
        .... */

// Ist address kein Optional, erzeugt ein Person-Objekt automatisch eine Instanz der Klasse AddressData für die Eigenschaft.
// Das muss passieren, damit die Klasse ordnungsgemäß initialisert wird.
// Anschließend können die verschiedenen Bestandteile der Adressdaten problemlos zugewiesen und ausgelesen werden.
// Durch die Punktnotation erhalten wir eine Verkettung der Eigenschaften und Objektnamen.
// Im nächsten Listing funktioniert das ebenso mit der abgeleiteten Klasse "Emplyee".
// Sie erbt die Eigenschaft address von Person.

        // Employee-Instanz erzeugen:
        /* var mike
            = Employee(firstName: "Mike", lastName: "Maurer", age: 51)
        
        // Adressdaten können sofort zugewiesen werden:
 
        mike.address.street = "Beethovenring"
        mike.address.zipCode = "59423"
        mike.address.city = "Unna" */

// Ist "address" ein Optional, gibt es für ein Person-Objekt nicht automatisch eine Instanz für die Adressdaten 
// und man muss eine Instanz erzeugen, falls die Person oder der Angestellte über eine Anschrift verfügen soll.

        // Employee-Instanz erzeugen:
        /* var mike
            = Employee(firstName: "Mike", lastName: "Maurer", age: 51)
 
        // Address-Instanz erzeugen:
        var mikesAddress
            =Address(street: "Beethovenring", zipCode: "59423", city: "Unna")
 
        // Address-Objekt dem Employee-Objekt zuweisen
            mike.address = mikesAddress */

// Nicht anders als bei String oder Double können Instanzen komplexer Klassen mit einer Zuweisung für den Wert
// für eine Eigenschaft gesetzt werden. Erst dann verfügt das Employee-Objekt, im Code der Bezeichner mike,
// über eine Instanz, die Adressdaten (mikesAddress) verwalten kann. Zuvor hatte der Angestellte keine Adresse.

// Eine alternative Art den Code zu schreiben ergibt sich, wenn der Person-Instanz zunächst eine neue Instanz
// von AddressData zugewiesen wird und erst anschließend die einzelnen Werte der Anschrift gesetzt werden.
// Da address ein Optional ist, müssen wir dem Namen immer ein Ausrufezeichen anhängen, um an die Eigenschaften
// street, zipcode und city zu gelangen. Der Optional muss ausgepackt werden.
// Ansonsten hätten wir nur einen Bezeichner, den wir auf nil prüfen könnten:

        // Employee-Instanz erzeugen:
        /* var mike
            = Employee(firstName: "Mike", lastName: "Maurer", age: 51)
 
        // Address-Data-Objekt dem Employee-Objekt zuweisen:
        mike.address = AddressData()
 
        // Eigenschaften der Klasse nachträglich setzen:
        mike.address!.street = "Beethovenring"
        mike.address!.zipCode = "59423"
        mike.address!.city = "Unna" */


// OPTIONAL-CHAINING:
// Will man im Programm den Wohnort des Angestellten ausgeben, sollte man prüfen, ob es überhaupt ein
// AddressData-Objekt für die Eigenschaft gibt.
// Um ganz sicher zu sein, sollte man sogar kontrollieren, ob man es mit einer gültigen Employee-Instanz
// zu tun hat, denn seit der Einführung der Failable-Initializer ist das nicht selbstverständlich.
// Werden Objekte aus Datenbankeinträgen oder aus den Daten aus dem Internet erstellt, gibt es auf dem 
// Weg zu einer Instanz viele Vorgänge, die fehlschlagen können.
// Der Employee könnte daher ebenfalls ein Optional sein, wie es im folgenden Beispiel der Fall ist.

        // Employee-Instanz erzeugen (Employee ist ein Optional)
        /* var susi:Employee?
            = Employee(firstName: "Susanne", lastName: "Landmann", age: 28)
 
        // AddressData-Objekt dem Employee-Objekt zuweisen (Optional muss ausgepackt werden):
        susi!.address = AddressData()
 
        // Eigenschaften der Adresse nachträglich setzen:
        susi!.address!.street = "Mozartstraße"
        susi!.address!.zipCode = "59423"
        susi!.address!.city = "Unna" */

// Ein sicherer Weg, den Wohnort auszugeben, erfordert eine Überprüfung sämtlicher Optionals.
// Ohne AddressData-Objekt gibt es keinen Wohnort und ohne Employee-Objekt gibt es noch nicht einmal eine Adresse.

        // Gibt es ein Employee-Objekt?
        /* if susi != nil
        {
            // Gibt es ein AddressData-Objekt?
            if susi!.address != nil
            {
                print("Der Wohnort ist: \(susi!.address!.city)")
            }
        } */

// Die gezeigte Überprüfung ist notwendig, aber aufwendig, besonders dann, wenn man sie für mehrere Eigenschaften vornehmen muss.
// Swift bietet für das Problem eine Vereinfachung, die als Optional-Chaining bezeichnet wird.
// Aus den einzelnen Objekten und Eigenschaften wird eine Kette gebildet, vergleichbar mit der Punktnotation.
// Zusätzlich werden sämtliche Bezeichner durch ein Fragezeichen getrennt, was in Swift automatisch eine Überprüfung auf nil auslöst.

        // Überprüfung mit Optional-Chaining
        /* if let theCity = susi?address?.city
        {
            print("Der Wohnort ist: \(theCity)")
        } */

// Während ein angehängtes Ausrufezeichen den Wert eines Optionals erzwungenermaßen auspackt (forced unwrapping),
// resultiert das Fragezeichen in einer weniger aggressiven Vorgehensweise.
// Der Aufruf liefert den Wert des Optionals, sofern es einen Wert gibt, ansonsten nil.
// Der komplette Ausdruck liefert den Wert der Eigenschaft city, falls keiner der Eigenschaften nil ist.
// Er liefert für den kompletten Ausdruck nil, falls ein beliebiges Objekt in der Kette nil ist.
// Durch nil ist die Bedingung in der if-Schleife nicht erfüllt und die print-Anweisung wird nicht ausgeführt.
// Die komplette Überprüfung kann somit durchgeführt werden, ohne dass ein Objekt der Kette
// erzwungenermaßen ausgepackt werden muss.

// Optional-Chaining funktioniert in Swift nicht nur, wenn eine Eigenschaft ausgelesen wird, sondern auch,
// wenn ein Wert gesetzt werden soll.
// Ersetzt man im Listing die Ausrufezeichen durch Fragezeichen, werden Werte nur zugewiesen, wenn das Objekt existiert:


        /*susi?.address = AddressData()

        // Eigenschaften der Adresse nachträglich setzen:
        susi?.address?.street = "Mozartstraße"
        susi?.address?.zipCode = "59423"
        susi?.address?.city = "Unna" */

// Nach der Änderung läuft das Programm sogar fehlerfrei, wenn kein Employee-Objekt existiert.
// Dies kann man testen, indem man im Code die Instanziierung entfernt.
// Jetzt kann keiner Eigenschaft ein Wert zugewiesen werden.
// Trotzdem erhält man keine Fehlermeldung, den durch das Optinal-Chaining werden alle Objekte
// automatisch auf nil geprüft und ein Wert nur zugewiesen, wenn es möglich ist.

// Optional-Chaining funktioniert ebenfalls mit Methoden wie das folgende Listing zeigt.
// Haben wir es mit susi mit einer Instanz zu tun, wird die Methode aufgerufen, andernfalls passiert nichts:

        // susi?.getAllPropertiesAsString()

// COALESCING-OPERATOR:
// Eine andere Möglichkeit, die Arbeit mit Optionals zu vereinfachen, bietet der Coalescing-Operator,
// der in Swift mit zwei aufeinanderfolgenden Fragezeichen implementiert wird.
// Er kann eingesetzt werden, wenn ein Standardwert eingesetzt werden soll, falls ein Objekt oder eine Kette
// aus Eigenschaften nil ergibt.
// Das nächste Listing zeigt einen typischen Anwendungsfall:

        // Zuweisung mit einem Coalescing-Operator:
        /* var myCity = susi?.address?.city ?? "Kein Wohnort hinterlegt"
        print(myCity) */

// Ist ein Datentyp ein Optional, sollte vor jedem Zugriff geprüft werden,
// ob für die Variable oder die Konstante ein gültiger Wert hinterlegt wurde.
// Swift bietet dafür das Optional-Binding, das Optional-Chaining und den
// Coalescing-Operator. Eine Überprüfung mit einer if-Struktur liefert ebenfalls
// gute Dienste. Ungeprüft sollte man niemals aud den Wert eines Optionals zugreifen,
// denn es besteht die Gefahr, dass es keinen Wert besitzt!
        
