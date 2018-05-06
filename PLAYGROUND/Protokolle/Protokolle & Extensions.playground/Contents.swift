// update: 13.07.2016, 16:00

import Cocoa


// BSP1:
protocol Lebensmittel {
    var kalorien: Int {get}                     // Read only
    var mindestHaltbarBis: String {get set}     // Lese und Schreibzugriff
    
    func getKohlenhydrateInGramm() -> Int
    
    init(kalorien: Int)
}

class Apfel: Lebensmittel {
    let kalorien: Int
    var mindestHaltbarBis: String
    
    func getKohlenhydrateInGramm() -> Int {
        return 30
    }
    required init(kalorien: Int) {
        self.kalorien = kalorien
        self.mindestHaltbarBis = "01.01.11111"
    }
    
    func entkernen() {}
}

var apfel: Lebensmittel = Apfel(kalorien: 100)
// Die Funktion "entkernen" kann nicht aufgerufen werden,
// da das Protokoll über der Klasse steht.


// BSP2:
protocol Getränk {
    var kh: Int {get}
}
protocol AlkoholischesGetränk: Getränk {        // Protokoll implementiert anderes Protokoll
    var alkoholInProzent: Double {get}          // und erbt von diesem
}


/* Im Gegensatz zur Vererbung oder Assoziation wird eine Klasse durch ein Protokoll
nicht um Eigenschaften oder Methoden erweitert, die Klasse erhält lediglich Vorgaben darüber,
welche Methoden implementiert werden sollen und wie deren Signaturen auszusehen haben.
Solche Vereinbarungen werden beim Zusammenspiel verschiedener Komponenten wichtig,
weshalb sie gelegentlich als "Verträge" oder "Contracts" bezeichnet werden.
Implementiert eine Klasse ein Protokoll, geht sie die Verpflichtung ein, die dort beschriebenen
Methoden umzusetzen. Andere Programmiersprachen verwenden für eine ähnliche Vorgehensweise
den Begriff "Interface".

Eine Klasse in Swift kann immer nur von einer anderen Klasse erben.
Eine Klasse kann allerdings von mehreren Schnittstellen / Protokollen erben.
Ein Protokoll definiert immer die Verbindung zwischen zwei Komponenten.

Ein Protokoll unterscheidet sich von einer Klasse durch 2 Punkte:
Erstens: Ein Protokoll kann keine Instanz erzeugen.
Zweitens: Eine Methode darf in einem Protokoll nicht vollständig implementiert werden
und somit quasi nur aus dem Kopf, den Parametern und aus dem Rückgabetyp bestehen.
Das gilt auch für die Definition von Eigenschaften:
Sie dürfen lediglich mit { get / set } angedeutet, aber nicht implemtiert werden.

Obwohl Protokolle keine eigene Implementierung haben, gelten sie per Definition trotzdem als
(Daten)typ. D.h. sie können bspw. in Funktionen als Parameter verwendet werden. Sie können auch als
Typ für eine Variable, Eigenschaft oder Konstante dienen und in einem Array oder Dict. verwendet werden.

Für dieses Projekt soll ein Protokoll entwickelt werden, das die Aufenthaltsorte von Objekten
abfragen soll. Zu diesem Zweck wird eine Methode definiert, die "getLocation" heißt.

Für das Protokoll wird ein Swift-File erzeugt, mit der eine komplette leere Datei generiert wird.

        import Foundation
 
        protocol ObjectInformation
        {
            func getLocation() -> String
        }

Die Deklaration eines Protokolls beginnt mit dem Schlüsselwort "protocol", gefolgt vom Protokollnamen.
In dem Block aus geschweiften Klammern folgen die vom Protokoll vorgegebenen Methoden oder Eigenschaften.
Im aktuellen Protokoll ist das die Methode "getLocation", die keine Parameter entgegennimmt, aber einen
String zurückgibt.

Das Protokoll mit dem Namen "ObjectInformation" kann jetzt von beliebigen Klassen verwendet werden.
Soll die Klasse "Person" das Protokoll umsetzen, muss im ersten Schritt die Klassendefiniton erweitert werden.

        public class Person: ObjectInformation
        {
            public func getLocation() -> String 
            {
                return " "
            }

Protokolle gewährleisten ausschließlich die Implementierung der vorgegebenen Methode,
nicht aber, dass sich in der Methode sinnvoller Code verbirgt.
Für die Klasse "Person" werden an dieser Stelle die Adressdaten zurückgegeben, doch bei anderen Klassen,
die das gleiche Protokoll umsetzen, kann der Rückgabewert anders aussehen.
Bei Flugzeugen oder Schiffen sind es möglicherweise die Koordinaten, an denen sie sich befinden,
während getLocation bei einer Lagerverwaltung nur das Fach oder das Regal bezeichnet, in dem ein Artikel
abgelegt ist. Der Rückgabetyp der Methoden ist immer eine Zeichenkette, denn sie wird durch das Protokoll vorgegeben.

        public func getLocation() -> String
        {
            var location = " "
            if self.address != nil
            {
                location 
                = "\(self.address?.zipCode) \(self.address?.city)"
            }
            return location
        }

Protokolle stehen außerhalb der Klassenhierarchie. Eine Klasse erbt nicht von einem Protokoll,
sondern verpflichtet sich, die Vorgaben eines oder mehrerer Protokolle zu implementieren.
Man sagt: Die Klasse passt sich dem Protokoll an.
So ist es möglich, dass unterschiedliche Klassen identische Protokolle verwenden.
Die in anderen Situationen benötigte gemeinsame Elternklasse ist nicht erforderlich.
Durch das Protokoll wird vorgegeben, dass die Klassen auf die gleichen Methodenaufrufe reagieren.

Das Projekt wird um die Klasse "Item" erweitert. Diese implementiert ebenfalls das Object-Information-Protokoll,
ist aber nicht von der Klasse "Person" abgeleitet.
Die Klasse wird zunächst um die Protokolldeklaration ergänzt:

        public class Item: ObjectInformation
        {
            public func getLocation() -> String
            {
                return "Ich bin im Lager."
            }
        }

PROTOKOLLE STATT DATENTYPEN:
Bei der Deklaration einer Variablen oder einer Konstanten kann ein Protokoll explizit als Alternative
zu einem Datentypen angegeben werden.
So wird es möglich, einem Bezeichner unterschiedliche Typen zuzuweisen, ohne den Typ "AnyObject"
verwenden zu müssen. Zugewiesen werden können ausschließlich Klassen, die das angegebene Protokoll
implementiert haben. Das sind in unserem Projekt die Klasse Person, die davon abgeleitete Klasse Employee
und die neue Klasse "Item".
In der Datei main.swift kann das so aussehen:

        // Protokoll statt eines Datentyps
        // var info:ObjectInformation = Employee()
        // ODER:
        // var info:ObjectInformation = Person()
        // ODER:
        // var info:ObjectInformation = Item()

// Da durch das Protokoll lediglich sichergestellt wurde, dass die verwendeten Typen die "getLocation"-Methode
// implementieren, kann bei Instanzen, die in der gezeigten Art angelegt wurden, ausschließlich diese
// Methode aufgerufen werden. Zusätzliche Methoden oder Eigenschaften, die von der Klasse öffentlich angeboten werden,
// können wir nicht ansprechen.

        // Deklaration eines Employee mit einem Protokoll anstelle eines Datentyps
        // var info:ObjectInformation = Item()

        // Die Methode aus dem Protokoll kann aufgerufen werden
        // var location = info.getLocation()
        // print(location)

        // Andere Methoden können nicht aufgerufen werden
        // info.getAllPropertiesAsString()

// Ersetzen Protokolle die Datentypen bei den Parametern einer Funktion oder Methode, sorgen sie für zusätzliche
// Sicherheit im Programmcode. Innerhalb des Codeblocks kann nur auf Methoden und Eigenschaften zugegriffen werden,
// die im Protokoll definiert sind. Diese Einschränkung funktioniert sogar, wenn der übergebene Bezeichner
// zuvor als regulärer Typ ohne Protokoll definiert wurde.

        // Definition einer Fkt. mit einem Protokoll statt eines Datentypen
        // func outputLocation(objectInfo:ObjectInformation)
        // {
                // Aufruf der Methode, die im Protokoll deklariert wurde
                // var location = objectInfo.getLocation()
                // print(location)

                // Methode der Klasse kann hier nicht aufgerufen werden
                // var properties = employee.getAllPropertiesAsSting()
                // print(properties)
        // }

        // Deklaration eines Employees
        // var employee = Employee()
        // employee.firstName = "Max"
        // employee.lastName = "Müller"
        // employee.address = AddressData()
        // employee.address?.zipCode = "44227"
        // employee.address?.city = "Dortmund"

        // Methode kann hier aufgerufen werden
        // var properties = employee.getAllPropertiesAsSting()
        // print(properties)

        // Aufruf der Funktion
        // outputLocation(employee)

// Das gezeigte Beispiel ist ein typischer Anwendungsfall für ein Protokoll.
// Die Funktion ist in der Lage, verschiedene Typen entgegenzunehmen, sofern deren Klassen das 
// ObjectInformation-Protokoll umsetzen. Ein Aufruf würde ebenso mit einem Person- oder Item-Objekt
// funktionieren. Welche Methoden und Eigenschaften die Klasse zusätzlich anbietet, spielt in der Funktion
// keine Rolle, da dort ausschließlich im Protokoll definierten Vorgaben verwendet werden können.


// OPTIONALE PROTOKOLLE:
// Die von einem Protokoll vorgegebenen Methoden müssen nicht zwangsläufig immer implementiert werden, 
// es besteht auch die Möglichkeit, die Vorgaben aus einem Protokoll als optional zu kennzeichnen.
// Die Klasse ist dann nicht länger verpflichtet, eine Methode umzusetzen. Ein optionales Protokoll definiert
// die Verbindungen zu Komponenten, die nicht in jeder Situation benötigt werden.

// Soll unser ObjectInformation-Protokoll um eine optionale Vorgabe erweitert werden, ist es notwendig das 
// Protokoll mit dem Attribut @objc zu definieren.
// Zusätzlich wird der deklarierten Methode das Schlüsselwort optional vorangestellt.
// Das folgende Listing erweitert unser Protokoll um die optionale Methode getInformation.

        // @objc public protocol ObjectInformation
        // {
                // func getLocation() -> String
                // optional func getInformation() -> String
        // }

// Durch das Attribut @objc erzeugt der Compiler ein Protokoll, das zusätzlich bei Objective-C-Klassen 
// angewendet werden kann, denn in einem Xcode-Projekt können beide Programmiersprachen gemeinsam zum
// Einsatz kommen. Das @objc-Attribut kann ebenso für Swift-Klassen verwendet werden, die in einem Projekt
// mit Objective-C-Klassen zusammenarbeiten sollen.

// In den Klassen "Person" und "Item" steht es uns jetzt frei, die Methode umzusetzen, wir sind nicht verpflichtet,
// das zu tun. Die Eingabehilfe wird uns jedoch auch ohne äußeren Zwang die Methode aus dem Protokoll
// vorschlagen, sobald wir beginnen, ihren Namen einzugeben.
// In Programmen haben wir es jetzt mit einer optionalen Methode zu tun, die in den Klassen nicht zwangsläufig
// implementiert wurde. Ähnlich einem optionalen Wert kann sie nil sein. Vor jedem Aufruf ist eine Prüfung
// daher unverzichtbar, und das Fragezeichen des Optional-Chaining kann erneut gute Dienste leisten.

// Im folgenden Listing wurde die outputLocation-Fkt.um die Ausgabe der getInformation-Methode erweitert.
// Zusätzlich wird der Coalescing-Operator verwendet, um für die Variable "info" einen Wert zu setzen,
// wenn getInformation in der Klasse des übergebenen Objektes nicht implementiert wurde.

        // func outputLocation(objectInfo:ObjectInformation)
        // {
                // Aufruf der Methode, die im Protokoll deklariert wurde
                // var location = objectInfo.getLocation()
                // print(location)

                // Aufruf einer Methode, die optional im Protokoll deklariert wurde
                // var info
                // = objectInfo.getInformation?() ?? "Keine Informationen"
                // print(info)
        // }

// In den Frameworks gibt es zahllose Protokolle, die optionale Aufrufe beschreiben.
// Oft handelt es sich um Rückmeldungen, wenn Aufgaben abgeschlossen wurden oder um andere
// Statusmeldungen. Sie erhalten Meldungen, wenn ihr Programm erfolgreich gestartet wurde
// oder kurz bevor es beendet wird. 


// EXTENSIONS
// Eine weitere Möglichkeit, existierende Klassen um zusätzliche Methoden zu erweitern, bieten Extensions,
// die bei der Softwareentwicklung in Swift mehrere Aufgaben übernehmen können. 
// Extensions ermöglichen es, den Programmcode einer Klasse auf mehrere Dateien zu verteilen und somit eine
// modulare Struktur innerhalb eines Projektes.
// Der zweite Vorteil von Extensions besteht in der Fähigkeit, eine bestehende Klasse um zusätzliche Methoden
// zu erweitern, ohne dass im Projekt mit Vererbung gearbeit werden muss. 
// Diese Möglichkeit besteht sogar für Klassen, deren Quellcode für die Entwickler nicht einsehbar ist.

// In der aktuellen Version der Entwicklungsumgebung gibt es keine gesonderte Vorlage zum Erstellen von Extensions,
// die leere Datei aus dem Template Swift File muss bei dieser Aufgabe wieder als Ausgangspunkt dienen.

// Im Programmcode wird eine Extension mit dem Schlüsselwort "extension" deklariert, gefolgt von dem Namen
// der Klasse, die erweitert werden soll. 
// In den Sprachen C++ oder C# liefern die Methoden left und right den linken oder rechten Abschnitt einer Zeichenkette,
// abhängig von der Anzahl der Zeichen, die als Parameter übergeben werden.
// In Swift kann man diese Aufgaben mit den Methoden prefix und suffix lösen.
// Eine entsprechende Erweiterung für den Typ String zeigt das folgende Listing.
// Da die Methoden auf eine Instanz von String angewendet werden, erhalten wir in der Extension über self Zugriff
// auf die aktuelle Zeichenkette.

        /* extension String
        {
            public func left(charCount:Int) -> String
            {
                return String(self.characters.prefix(charCount))
            }
    
            public func right(charCount:Int) -> String
            {
                return String(self.characters.suffix(charCount))
            } */

// In einigen Programmiersprachen kann man mit der Methode "contains" prüfen, ob eine Zeichenkette eine andere
// enthält, doch in Swift ist so eine Überprüfung nur mit rangeOfString möglich. Dieser Aufruf liefert als
// Rückgabewert allerding keinen booleschen Wert, sondern die Range, in der die gesuchte Zeichenkette enthalten
// ist oder nil, wenn es keine Übereinstimmung gibt. 
// Eine "contains-Methode", die nur true oder false zurückgibt, können wir in unserer Extension so umsetzen:

        /* func contains(find: String) -> Bool
        {
            if self.rangeOfString(find) != nil
            {
                return true
            }
                return false
        } */

// Extensions, die bei Arbeit an einem Projekt entwickelt werdem, stehen anschließend auch automatisch anderen
// Projekten zur Verfügung. Soll dieselbe Datei in mehreren Projekten zum Einsatz kommen, muss beim
// Hinzufügen lediglich die Option "Coppy Items id needed" deaktiviert werden. Dann arbeitet man mit einer Referenz.

// Extensions können nicht verwendet werden, um die Methoden einer Klasse zu überschreiben. 
// Außerdem ist es nicht möglich, einer Klasse mit Hilfe einer Extension Instanzvariablen hinzuzufügen. 
// Das funktioniert nur in der ursprünglichen Klasse. Steht der Quellcode nicht zur Verfügung, können Vererbung oder
// Assoziationen helfen. 
