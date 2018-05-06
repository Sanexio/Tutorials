//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* 
In Swift wurden alle im originären Objective-C Framework entwickelten Datentypen und Funktionen übernommen.
Direkt zu Beginn eines Swift Programms befindet sich deshalb auch eine Anweisung, die den Import dieser Bibliotheken ermöglicht.
Mit dem UIKit wird eine Bibliothek importiert, die Definitonen für Controls (z.B. Button, Label etc.) ermöglicht.
*/


// NSNumber: Datentyp zur Speicherung von Zahlen
// Aufnahme unterschiedlicher Datentypen möglich (Bsp.: Int, UInt, Float, Double, Bool...)

let pi:Double = 3.14
var pi_nsnumber:NSNumber=0
pi_nsnumber = pi                // Swift sorgt automatisch für die notwendige Umwandlung in bspw. Integer oder Float
print(pi_nsnumber)



// NSString: Datentyp zur Speicherung von Zeichenketten

func beispiel(p1: NSString) {
   print(p1)                    // WOHER weiss Swift an dieser Stelle, welche Zeichenkette p1 zugeordnet ist?    -> Muss bedeuten: myString = p1
}
var myyString="Hallo"
beispiel(myyString)


// NSDate: Datumswert - aktuell noch kein Gegenstück in Swift vorhanden

var datum = NSDate()
print(datum)

let dateFormatter = NSDateFormatter()                   // Mit der Klasse NSDateFormatter kann der anzuzeigende Wert geändert werden
dateFormatter.dateFormat = "dd.MM.yyyy '-' hh:mm"
let ausgabe = dateFormatter.stringFromDate(NSDate())

datum.dateByAddingTimeInterval(1000)                    // Aufaddieren einer Zeitspanne auf ein Datum - Parameter wird in Sekunden angegeben


// NSRange: Bestimmung von Anzahl und Position von Elementen innerhalb einer Menge (bspw. einer Zeichenkette)

var myString: NSString = "Zeichen in einer Zeichenkette zählen"     // an welcher Stelle beginnt ein Wort und wie lang ist es?
var nsRangeValue: NSRange = myString.rangeOfString("einer")         // Eine Variable vom Typ NSRange wird erzeugt; mit der Funktion rangeOfString wird die Position und Länge des Elements bestimmt
print(nsRangeValue)

// NSTimeInterval: Erfassung einer Zeitspanne in Sekunden

var zeitspanne = NSTimeInterval()                                   // Variable vom Typ NSTimeInterval wird angelegt
var currentTime = NSDate.timeIntervalSinceReferenceDate()           // Initialisierung zweier weiterer Variablen mit der Funktion timeIntervalSinceReferenceDate
var currentTime2 = NSDate.timeIntervalSinceReferenceDate()          // diese Funktion liefert einen Referenzwert, ausgehend vom 1 Jan 2001 GMT
zeitspanne = currentTime2 - currentTime                             // Beide Zeitwerte werden voneinander abgezogen und der Variablen zeitspanne zugewiesen


// NSArray / NSMutableArray:

let zahlen = NSArray(array: ["Eins","ZWei","Drei","Vier"])

/* Im Unterschied zu dem Datentyp Array in Swift besteht darin, dass NSArray jeden Datentyp speichern kann, und einem NSArray ist auch nicht bekannt, welche Typen es enthält.
Ein Swift Array speichert nur Elemente eines bestimmten Typs. Ein weiterer Unterschied liegt darin, dass ein NSArray nur einmalig mit Werten initialisiert wird und anschließend
nicht mehr änderbar ist. Hier kommt das NSMutableArray ins Spiel. Es bietet denselben Funktionsumfang mit dem Unterschied, dass der Inhalt auch änderbar ist. 
Analoges gilt für die Datentypen NSDictionary und NSMutableDictionary. Hier können beliebige Werte im Value-Teil gespeichert werden; als Key kommen bespw. String- oder Integerwerte infrage.
*/ 

