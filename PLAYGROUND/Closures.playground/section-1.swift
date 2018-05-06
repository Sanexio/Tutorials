// update 02.08.16, 15:00

// CLOSURES

import Cocoa
import Foundation
import XCPlayground

/* Mit Closures werden nicht nur Werte sondern auch
Programmcode in einer Variablen oder Konstanten abgelegt.
Funktionen können über Parameter an andere Funktionen übergeben werden.

In Objective-C tragen ähnliche Strukturen den Namen Blocks.
Einige andere Programmiersprachen verwenden als Bezeichnung Lambda-Ausdrücke.
Closures oder zu Deutsch Funktionsabschlüsse sind Codeblöcke, 
die innerhalb eines Programms weitergegeben und verwendet werden können.

Swift kennt drei Typen von Closures:
- Globale Funktionen: besitzen Namen, liefern aber keinen Wert zurück
- Verschachtelte Funktionen: besitzen Namen und erhalten Werte von der umschließenden Funktion
- Closure Expressions: nehmen Werte als Parameter entgegen und verarbeiten diese
 
 
ALLGEMEINE DEFINITION EINER CLOSURE:
 
 { (parameters) -> return type in
 
    statements
 
 }
 

VERGLEICH zw FUNKTIONEN & CLOSURES: */

func addFunction(value1:Double, value2:Double) -> Double        // Funktionsdefinition
{
    return value1 + value2
}

var sum = addFunction(22.72, value2: 77.28)                     // Funktionsaufruf


/* Eine Closure ist ebenfalls eine Funktion,
beginnt allerdings mit einer geschweiften Klammer
und erst dann folgen die Angaben für die Parameter.
Die Anweisungen, die die Closure ausführen soll,
folgen nach dem Schlüsselwort "in".
 
        {
            (value1:Double, value2:Double) -> Double in
            return value1 + value2
        }
 
Um aufgerufen werden zu können, muss die Closure
erst einer Var. oder Konst. zugewiesen werden:
 
var myClosure =                                                 // Closure-Definition
        {
            (value1:Double, value2:Double) -> Double in
            return value1 + value2
        }
 
Der Aufruf der Closure erfolgt wie bei einer Fkt, 
mit dem Unterschied, dass der Bezeichner eine Variable ist.
Diese Variable erhält damit Anweisungen:
 
        var closureSum = myClosure(55.55, 33.44)                // Closure-Aufruf
 
Normalerweise erkennt der Compiler automatisch Closures.
Der Typ kann aber auch explizit angegeben werden.
Es ist eine Fkt. und entspricht genau den Typen von Parametern 
und dem Rückgabewert, die in der Closure verwendet werden: */
 
 var myClosure:((Double, Double) -> Double) =                   // Zuweisung der Closure zu einer Variablen
 {                                                              // Mit "{" Beginn der Definition der Closure
 (value1:Double, value2:Double) -> Double in                    // nach dem "in" folgen die Anweisungen
 return value1 + value2
 }
 
 var closureSum = myClosure(55.001, 33.44)                      // Die Closure aufrufen



// Lsg. eines Sortieralgorithmus m.H. einer Fkt.:
let numbersX = [5, 3, 6, 4, 1, 8]
func sortieren(a: Int, b: Int) -> Bool {
    return a < b
}
numbersX.sort(sortieren)



numbersX.sort(<)
numbersX.sort(>)



// Lsg. eines Sortieralgorithmus m.H. von Closures:
numbersX.sort({ (a: Int, b: Int) -> Bool in
    return a < b
})

// type inference:
let sorted1 = numbersX.sort({ (a, b) -> Bool in
    return a < b
})

// single expression closure:
let sorted2 = numbersX.sort({ (a,b) in a < b })
sorted2

// shorthand argument names:
let sorted3 = numbersX.sort({ $0 < $1})
sorted3

// operator functions:
let sorted4 = numbersX.sort(<)



// Trailing Closures (letzter Parameter eines Fkt.Aufrufs):
// BSP 1:
func sort(sortierer: (Int, Int) -> Bool) {
    // ...
}
sort({(a: Int, b: Int) in return a < b})

sort() { (a: Int, b: Int) in                        // Closure nachgestellt und nicht im Körper enthalten
    return a < b
}

// BSP 2:
func math(a: Int, _ b: Int, _ math: (Int, Int) -> Int) -> Int {
    return math(a, b)
}
math(5, 10, {(a: Int, b: Int) in return a + b})      // normale Definition

math(5, 10) { (a: Int, b: Int) in                    // Definition als Trailing Closure
    return a + b
}



// Closure-CaptureValues:

// Beispiel einer Helperfunktion:
func prepareGreeting(name: String) -> String {
    
    // let hello = "Hallo \(name)"                  // einfache Variante
    
    let hello = helper(name)                        // zusätzliche Funktionalitäten durch Helper-Fkt.
    
    return hello
}
func helper(name: String) -> String {
    // if Alter < 30 
    // ... DU
    // else
    // ... SIE
    let hello = "Hallo \(name)"
    return hello
}
prepareGreeting("Siggi")


// Umsetzung mit einer Closure:
func closureGreeting(name: String) -> () -> String {
    
    let closure = { return "Hallo \(name)" }
    return closure
}
let greetFunction = closureGreeting("Siggi")
greetFunction()                                 // Wert wird erst bei Generierung der Funktion erzeugt



/* CLOSURES ALS PARAMETER:

In der folgenden "createRandomNumbers"-Fkt. werden Zufallszahlen erzeugt.
Was mit den Daten nach Abschluss der Berechnungen zu tun ist, 
wird der Fkt. über eine Closure mitgeteilt.
Die Closure wird zusammen mit den Zufallszahlen als Parameter übergeben.
Die Funktion erzeugt somit die Zufallszahlen und übergibt sie an die Closure.
Die übergebene Closure steht in der Funktion unter dem Namen "action" zur Verfügung.
Sie nimmt ein Integer-Array entgegen und liefert keinen Wert zurück.*/


func createRandomNumbers(count:Int, action:(value:[Int]) ->() )         // Funktion zur Erzeugung von Zufallszahlen
{
    var numbers = [Int]()                                               // leeres Array zur Ablage der Zahlen
    
    for _ in 0 ..< count                                                // es sollen 5 Zahlen erzeugt werden (s.u.)
    {
        let number = Int(arc4random_uniform(200))                       // Zufallszahlen von 0 bis 199 generieren
        numbers.append(number)                                          // neu erzeugte Zahl wird dem Array angehängt
    }
    
    action(value: numbers)                                              // Closure wird aufrufen
}                                                                       // nimmt Array entgegen und liefert keinen Wert

var output =
    {
        (values:[Int]) -> () in
        for value in values
        {
            print("Wert: \(value)")
        }
        
        print("Der erste Wert ist: \(values.first!)")
        print("Der letzte Wert ist: \(values.last!)")
}

// Funktionsaufruf mit Anzahl der Zufallszahlen und dem Closure als Parameter:
createRandomNumbers(5, action: output)


/* Die Closure übernimmt die Aufgabe eines Completion-Handler.
Beim Aufruf wird der Funktion der Code übergeben, 
der nach Abschluss der Arbeiten ausgeführt werden soll.
Die createRandomNumbers-Methode könnte auch andere Aufgaben initiieren.
Man müsste lediglich eine andere Closure als Parameter übergeben.
So kann z.B. die Ausgabe erweitert werden, ohne dass createRandomNumbers verändert wird.
Completion-Handler kommen zum Einsatz, wenn Aufgaben asynchron übernommen werden sollen.
Sie folgen alle dem sehr einfachen Schema:
Verarbeite diesen Code, nachdem Du Deine Arbeit abgeschlossen hast.
BEISPIELE:
Zeige das Bild, nachdem es geladen wurde.
Aktualisiere die Tabelle, nachdem die Daten berechnet wurden. */

createRandomNumbers(5)                                                  // Aufruf als Inline-Closure
{
    (values:[Int]) -> () in
    for value in values
    {
        print("Wert: \(value)")
    }
    print("Der erste Wert ist: \(values.first!)")
    print("Der letzte Wert ist: \(values.last!)")
}


/* Das nächste Beispiel zeigt einen asynchronen Programmablauf.
Mit der "map"-Methode kann mit geringem Aufwand jedes Element
aus einem Array angesprochen werden. */

var showFriends =                                                       // Definition eines Closures zu Ausgabe
    {
        (name:String) -> Any in
        print("Hallo \(name)!")
    }

var friends = ["Mike", "Marika", "Andreas", "Peter", "Sabine"]


friends.map(showFriends)                                                // Alle Array-Elemente ansprechen


/* Closures müssen nicht zwangsläufig Variablen zugewiesen werden.
Über die Inline-Schreibweise wird der Codeblock direkt in den Funktionsaufruf geschrieben.
Für die map-Methode sieht das dann so aus: */

friends.map({                                                           // Closure als Inline-Aufruf
    (name:String) -> () in
    print("Hallo \(name)")
})

/* Es ist nicht leicht, bei den Klammern die Übersicht zu behalten.
Daher erlaubt es Swift den Aufruf zu verkürzen.
Bei Inline-Closures können statt einer expliziten Angabe 
der Parameter Platzhalter verwendet werden.
Der einzige Parameter in der Closure kann über $0 angesprochen werden.
$0 entspricht immer genau einem Element aus dem Array.
So kann die ganze Anweisung in einer Zeile geschrieben werden: */

friends.map({ print("Hallo \($0)!") })                                  // Inline-Closure Version 2

/* Ist der Closure der letzte Parameter, der übergeben werden muss, 
kann man ihn alternativ nach der runden Klammer schreiben.
So wird der Code noch ein wenig übersichtlicher
und die Klammern sind weniger tief verschachtelt. */

friends.map(){ print("Hallo \($0)!") }                                  // Inline-Closure Version 3

/* Ist die Closure der einzige Parameter im Aufruf, 
kann man auf die runden Klammern komplett verzichten: */

friends.map{ print("Hallo \($0)!") }                                    // Inline-Closure Version 4


/* Die Closure für die createRandomNumbers - Funktion 
kann ebenfalls in der Inline-Schreibweise programmiert werden.
Die Anzahl der Zufallszahlen wird in den runden Klammern übergeben.
Als letzter Parameter folgt anschließend die Closure. */

friends.map(){print("Hallo \($0)!")}


// ARRAYS SORTIEREN MIT CLOSURES:

// Im folgenden Listing wird mit der Anweisung {$0 < $1} die Sortierrichtung bestimmt.

var numbers = [99, 23, 64, 12, 47, 62, 77]                              // Ein Array aus ganzen Zahlen anlegen

numbers.sort{$0 < $1}                                                   // Die Zahlen sortieren

print(numbers)                                                          // Das sortierte Array ausgeben

// "<" & ">" Operatoren wurden bisher nur bei Fallunterscheidungen zum Vergleich von Werten eingesetzt.
// Das Ergebnis eines Vergleichs ist immer ein boolescher Wert, denn ein Ausdruck ist entweder true oder false.
// Man kann nun das Resultat einer solchen Operation auch problemlos einer Variablen zuweisen.
// In einer Closure ermittelt der Vergleich den Rückgabewert der Funktion.
// Für jeden Vergleich liefert die Closure einen booleschen Wert, denn entweder ist $0 kleiner als $1 oder nicht.
// Der Rückgabewert wird verwendet, um der sort-Methode mitzuteilen, ob die Zahlen in der gewünschten Reihenfolge sind oder nicht.
// Die Bezeichner $0 & $1 sind Platzhalter, mit denen jeweils 2 Werte aus dem Array an die Closure übergeben werden.
// Diese Aufgabe übernimmt die sort-Methode automatisch.
// Liefert die Funktion ein false, werden die Elemente von der sort-Methode neu angeordnet. 

var sortAscending =
    {
        (value1:Int , value2:Int) -> Bool in
        if value1 < value2
        {
            print("Werte sind richtig sortiert.")
            return true
        }
        print("Werte sind falsch sortiert.")
        return false
}

numbers.sort(sortAscending)                                             // die Zahlen mit der Closure sortieren

// Die Fähigkeit, eine Fkt. als Parameter entgegenzunehmen, verleiht der sort-Methode eine große Flexibilität.
// Die Sortierrichtung ist nicht fest vorgegeben, sondern wird durch Vgl. von je zwei Werten aus der Auflistung realisiert.
// Um die tatsächliche Umstrukturierung der Elemente muss sich der Entwickler nicht kümmern.

// Im nächsten Listing werden alle Werte < 50 aufsteigend, alle anderen Zahlen absteigend sortiert.

var sortDifferent =
    {
        (value1:Int , value2:Int) -> Bool in
        
        if value1 < 50
        {
            if value1 < value2
            {
                return true
            }
            return false
        }
        
        if value1 > value2
        {
            return true
        }
        return false
}

var differentNumbers = [99,23,64,12,47,62,77,50,35,68]                  // Ein Array aus ganzen Zahlen anlegen

differentNumbers.sort(sortDifferent)                                    // Die Zahlen mit der Closure sortieren


// Zum Vgl. der entsprechende Aufruf mit einer Inline-Closure in der verkürzten Schreibweise:

differentNumbers.sort
    {
        if $0 < 50
        {
            if $0 < $1
            {
                return true
            }
            return false
        }
        
        if $0 > $1
        {
            return true
        }
        return false
}


// VARIABLEN EINFANGEN, CAPTURING VALUES:
// Eine Closure hat nicht nur Zugriff auf die Werte, die ihr als Parameter übergeben werden, sondern auf alle in ihrem Gültigkeitsbereich.
// Man spricht dabei von Werte einfangen oder in der englischen Dokumentation von Capturing Values:

var value1 = 10
var value2 = 20

var capture =
    {
        () -> () in
        print("Aufruf im Closure:")
        print("value1 ist \(value1) und value2 ist \(value2).")
        value1 = 100
}

print("Vor dem Aufruf der Closure:")
print("value1 ist \(value1) und value2 ist \(value2).")

capture()

print("Nach dem Aufruf der Closure:")
print("value1 ist \(value1) und value2 ist \(value2).")

// Nicht eindeutig erkennbar, passieren mit den Variablen value1 und value2 im oben stehenden Code zwei verschiedene Dinge:
// Innerhalb der Closure ist value2 eine Kopie der gleichnamigen Variablen, denn ihr Wert soll innerhalb der Closure nur ausgegeben werden.
// Für value1 erzeugt der Compiler automatisch eine Referenz auf die ursprüngliche Variable, denn ihr Wert wird innerhalb der Closure geändert.
// Durch diese Referenz gilt die Änderung auch anschließend außerhalb der Closure. 
// Die Variablen werden bei der Ausführung der Closure "eingefangen" und nicht bei der Definition der Closure.



// Wie bei einer Funktion sind die Parameter einer Closure Konstanten, und ihre Werte können nach der Übergabe nicht geändert werden.
// Das wird erst durch die explizite Deklaration als Variable mit dem Schlüsselwort var möglich.
// Jetzt erhalten wir in der Closure jedoch keine Referenzen auf die originalen Werte, sondern nur Kopien der Werte.
// Trotzdem sollte diese Vorgehensweise für viele Aufgaben aus dem Programmieralltag ausreichen.
// Müssen mehrere Werte verändert werden, kann als Rückgabewerte für die Closure ein Tupel verwendet werden.
// Anschließend können die Werte des Tupels den ursprünglichen Variablen zugewiesen werden.

var captureCopy =
    {
        (var value1:Int, var value2:Int) -> () in
        print("Aufruf im Closure:")
        print("value1 ist \(value1) und value2 ist \(value2).")
        value1 = 500
}

value1 = 22
value2 = 33

captureCopy(value1, value2)

print("Nach dem Aufruf der Closure:")
print("value1 ist \(value1) und value2 ist \(value2).")



// Moderne Computer verfügen über mehrere Prozessorkerne, die es ermöglichen, verschiedene Aufgaben gleichzeitig zu bearbeiten.
// Asynchrone Vorgänge auf den Apple-Plattformen ermöglichte erst eine Technologie namens Grand Central Dispatch (GCD).
// Der Kern des GCD ist ein System aus Warteschlangen, die Aufgaben automatisch asynchron zum Hauptprogramm ausführen können.
// GCD übernimmt selbstständig das "Versenden" (dispatch) der Aufgaben an die verschiedenen Prozessorkerne.
// Hierdurch wird eine optimale Auslastung des Systems erreicht.
// Die Aufgaben für die Warteschlangen werden in Swift mit Closures realisiert.
// In eigenständigen Programmen sind asynchrone Aufrufe mit Grand Central Dispatch kein Problem.
// In einem Playground muss jedoch zusätzlich das XCPlayground-Framework importiert werden.
// Anschließend muss die Fkt. XCPSetExecutionShouldContinueIndefinitely mit true aufgerufen werden.
// Ohne diese Anweisung erhält man nur eine Ausgabe der Zeit.

// Eine der einfachsten Aufgaben ist die verzögerte Ausführung von Anweisungen mit der Funktion "dispatch_after".

XCPSetExecutionShouldContinueIndefinitely(true)

var outputTime =
    {
        () -> () in
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.FullStyle
        var dateString = formatter.stringFromDate(date)
        print(dateString)
}

outputTime()                                                                    // Closure direkt ausführen

let delay = Int64(2 * NSEC_PER_SEC)                                             // Zwei Sekunden

let futureTime = dispatch_time(DISPATCH_TIME_NOW, delay)                        // Jetzt + zwei Sekunden

let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)    // Eine Warteschlange vom GCD holen

dispatch_after(futureTime, queue , outputTime)                                  // Closure zeitverzögert ausführen

dispatch_after(futureTime, queue)                                               // Funktionsaufruf mit Inline-Closure
{
    let date = NSDate()
    let formatter = NSDateFormatter()
    formatter.timeStyle = NSDateFormatterStyle.FullStyle
    var dateString = formatter.stringFromDate(date)
    print(dateString)
}

// Der erste Parameter für den Befehl "dispatch_after" ist der genaue Zeitpunkt, an dem mit der Verzögerung begonnen werden soll.
// Dieser wird mit der Fkt. "dispatch_time" und der aktuellen Zeit berechnet wird.
// Die aktuelle Zeit erhalten wir mit der Variablen "DISPATCH_TIME_NOW" vom System selbst.
// Die Verzögerung für "dispatch_time", im Listing die Variable "delay", bestimmt die Abweichung von der angeg. Zeit.
// Hierfür benötigt die Funktion die Angabe in Nanosekunden. 
// Damit die Ausführung nach zwei Sek. beginnt, wird die 2 mit der Konstanten NSEC_PER_SEC multipliziert.
// ------------
// Der zweite Parameter für "dispatch_after" ist die Warteschlange, die zur Ausführung verwendet werden soll:
// "dispatch_get_global_queue" liefert vom GCD eine Warteschlange, in der Anweisungen mit der niedrigsten Priorität ausgeführt werden. 
// Als Parameter für diese Fkt. haben wir "DISPATCH_QUEUE_PRIORITY_BACKGROUND" und 0, der hier nur Platzhalterfunktion hat.
// ------------
// Die auszuführende Closure wird der Funktion als dritter Parameter übergeben. 
// Mit der Variablen "outputTime" wird ein Block definiert, der keinen Parameter entgegennimmt und keinen Rückgabewert liefert.
// In der Closure wird ein NSDate-Objekt erzeugt, welches automatisch die aktuelle Zeit und das aktuelle Datum erhält. 
// Der "NSDateFormatter" übernimmt die Ausgabe, aus der Zeit eine Zeichenkette zu generieren.
// Durch Zuweisung von "NSDateFormatterStyle.FullStyle" an "formatter.timeStyle" wird NSDate in einen String umgewandelt.
// Statt "FullStyle" kann man die Alternativen "LongStyle", "MediumStyle" und "ShortStyle" testen.


// Wie viele andere Funktionen aus den Apple-Frameworks ermöglicht die Fkt. "dispatch_after" ebenfalls Inline-Closures.
// Der auszuführende Block muss nicht zwangsläufig einer Variablen zugewiesen werden.
// Das war im o.g. Bsp. notwendig, um die Zeit sofort und zusätzlich verzögert auszugeben.
// Gäbe es nur eine Ausgabe, könnte der Code wie folgt aussehen:

// Funktionsaufrauf mit Inline-Closure

/*
dispatch-after(futureTime, queue)
{
    let date = NSDate()
    let formatter = NSDateFormatter()
    formatter.timeStyle = NSDateFormatterStyle.FullStyle
    var dateString = formatter.stringFromDate(date)
    print(dateString)
}
*/



// PARALLELE VERARBEITUNG:
// Soll eine parallel zu verarbeitende Aufgabe sofort gestartet werden, kann die Fkt. "dispatch_async" verwendet werden.
// Als erster Parameter wird ebenfalls eine Warteschlange entgegen genommen.
// Im folgenden Bsp. wird die Summe der Laufvariablen berechnet und anschließend ausgegeben.

XCPSetExecutionShouldContinueIndefinitely(true)

let dispatchQueue
    = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)

dispatch_async(dispatchQueue)
{
    var sum = 0.0;
    for i in 1  ..< 1000 
    {
        sum = sum + Double(i)
    }
    
    let mainQueue
        = dispatch_get_main_queue()
    dispatch_async(mainQueue)
    {
        print("Die Summe ist: \(sum).")
    }
}

// Wenn man die CMD-Taste drückt, wird der Mauspfeil zu einer Hand, sobald er sich über einer Anweisung oder Variablen befindet.
// Klickt man auf einen Bezeichner, springt Xcode zur Datei mit dessen Definition. 
// Für "DISPATCH_QUEUE_PRIORITY_BACKGROUND" führt uns das in eine Datei aus dem Framework.
// Dort kann man sehen, dass es insgesamt vier verschiedene Einstellungen gibt.
// Prioritäten sollte man abhängig von der Dringlichkeit der Aufgaben wählen.


// ASYNCHRONE AUFRUFE MITTELS COMPLETION-HANDLER:
// Einige Fkt. und Methoden aus den Apple-Frameworks sind bereits für eine asynchrone Verarbeitung vorbereitet.
// Sie erwarten als Parameter einen Completion-Handler, der die Anweisungen enthält, die ausgeführt werden sollen.
// Ein typisches Bsp. ist der asynchrone Download von Daten aus dem Internet.
// Im nächsten Bsp. wird der HTML-Quelltext einer Webseite von der Methode "sendAsynchronousRequest" geladen.
// Der Completion-Handler wird nach Abschluss der Übertragung ausgeführt.


XCPSetExecutionShouldContinueIndefinitely(true)

let url:NSURL? = NSURL(string: "http://www.cocoa-coding.de")        // ein NSURL-Objekt aus einer Zeichenkette erzeugen
let request:NSURLRequest = NSURLRequest(URL: url!)                  // einen Webrequest aus der URL erzeugen

NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue())       // den asynchronen Aufruf des Webrequest starten
{
    (response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
    
    if error == nil
    {
        var dataString = NSString(data: data!, encoding: UInt())
        print(dataString)
    }
    else
    {
        print("Fehler: \(error?.localizedDescription)")
    }
}

// Welche Parameter ein Completion-Handler entgegennehmen muss, können wir der Methodendefinition entnehmen.
// Dabei klickt man bei gedrückter CMD-Taste auf "sendAsynchronousRequest".
// Anschließend wird die Entwicklungsumgebung sämtliche Argumente für die Closure enzeigen.
// Ist der "NSError" ungleich "nil", tritt ein Fehler auf, der ausgegeben werden soll.
// Bei einem fehlerhaften Transfer befinden sich in einem NSData-Objekt die geladenen Informationen.
// Soll der Quelltext der Seite ausgegeben werden, muss er zunächst in eine Zeichenkette umgewandelt werden.
// Die Klasse "NSOperationQueue" wurde zusammen mit "NSOperation" ursprünglich eigenständig entwickelt.
// Seit OS X 10.6 und iOS 4 basieren sie auf Grand Central Dispatch.

// Bei der Entwicklung sollte man die Begriffe "gleichzeitig" und "parallel" jedoch nicht verwechseln.
// In vielen Situationen ist eine echte Gleichzeitigkeit nicht erforderlich oder nicht möglich.
// Es ist ausreichend, dem Nutzer nur den Anschein zu vermitteln, verschiedene Vorgänge würden gleichzeitig erledigt.
// Hierbei wird das System sehr schnell zwischen den einzelnen Anwendungen wechseln.
// Bspw. können im Browser weiter Tabs geöffnet werden, während eine Datei gespeichert wird.
// Das ist jedoch nicht immer zwangsläufig eine parallele Verarbeitung.
// Grand Central Dispatch verteilt die Aufgabe nur an verschiedene Prozessorkerne, wenn diese auch vorhanden sind.
// Nur dann gibt es eine echte parallele Verarbeitung, in der in einem Programm mehrere Prozesse gleichzeitig ablaufen.



// Lottosortierer als Funktion:
var lottoZahlenRaw = [12,45,23,11,9,7]
func lottoSortierer(zahl1: Int, zahl2: Int) -> Bool {
    return zahl1 < zahl2
}
var sortiert = lottoZahlenRaw.sort(lottoSortierer)


// Lottosortierer als Closure:
lottoZahlenRaw.sort{
    (zahl1: Int, zahl2: Int) -> Bool in
    return zahl1 < zahl2
}
// verkürzte Schreibweise:
var autoSort1 = lottoZahlenRaw.sort{zahl1, zahl2 in return zahl1 < zahl2}
autoSort1

// weitere Verkürzung:
var autoSort2 = lottoZahlenRaw.sort{zahl1, zahl2 in zahl1 < zahl2}
autoSort2

// noch weiter verkürzt:
var autoSort3 = lottoZahlenRaw.sort{$0 < $1}
autoSort3

// maximal verkürzt:
var autoSort4 = lottoZahlenRaw.sort(<)          // hier müssen runde Klammern gesetzt werden
autoSort4

