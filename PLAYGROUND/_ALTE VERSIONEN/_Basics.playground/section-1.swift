// update: 13.11.16, 16:00

import Foundation
import Cocoa

/*
SHORTCUTS:
Emojis:                     Control-Command-Leertaste
    |:                      ALT-7
   []:                      ALT-5 und ALT-6
   {}:                      ALT-8 und ALT-9
   ~:                       ALT-N
   \:                       UMSCHALT-ALT-7

Suchfunktion:               CMD + F
Auto-Vervollständigung:     Ctrl + SPACE
ShortCut-Leiste:            CMD + TAB

Klick mit gedrückter ALT-Taste: Dokumentation über einen Bezeichner wird angezeigt


OBJEKTORIENTIERTE PROGRAMMIERUNG:
Mit Erfindung graphischer Benutzeroberflächen gibt nicht mehr
das Programm dem User die Abfolge vor, sondern umgekehrt.
Hierbei werden die Aktionen des Users
als Nachricht an das Programm aufgefasst.
Jede Nachricht hat nun einen Adressaten. 
Diese Adressaten nennt man Objekte. 
Ein Objekt zeichnet sich durch zwei Eigenschaften aus:
Erstens kann es aufgrund der Nachricht ein Programm ausführen; 
dieses Programm bezeichnet man als Methode.
Zweitens kann ein Objekt Daten speichern.
Zusammengefasst: Ein Objekt ist eine Einheit, 
die aufgrund einer Nachricht eine Operation (Methode) 
ausführt und Daten speichern kann.



COMPILER, LINKER & BUILD:
Programme werden vom Compiler in Maschinensprache übersetzt.
Unser Standardcompiler heisst clang/LLVM (Low-Level-Virtual-Machine).
Er erzeugt Maschinencode für einen imaginären (virtuellen) Computer.
Daraus erzeugt dann ein weiterer Compiler Maschinencode für das Zielsystem.
Man kann Programme zur Übersichtlichkeit in zwei Module gliedern.
Beide Maschinencode-Dateien werden zum Schluss wieder zu einer Datei verschmolzen.
Dies macht der sogenannte LINKER. Das Ergebnis nennt man TARGET. 
Das erste Modul, genannt HEADER, enthält nur eine Art Inhaltsverzeichnis. 
In diesem Header wird also nur gesagt: "Dieses Modul enthält die Methode X."
Erst in einer zweiten Datei, der IMPLEMENTIERUNG, wird die Methode dann programmiert.
Der Header (also das Inhaltsverzeichnis) wird von Modul 2 importiert.
Das Modul 2 wird dann trotz der "unbekannten" Methode aus Modul 1 übersetzt.
Damit dies funktioniert, müssen dem Compiler drei Dateien übergeben werden:
- Header von Modul 2
- Header vom fremden Modul 1 
- Implementierung von Modul 2
Hierum kümmert sich der sogenannte Präprozessor.
Dieser bereitet die Eingabedaten vor und gibt sie weiter.
Er wird häufig von Compilern / Interpretern verwendet, 
einen Eingabetext zu konvertieren und das Ergebnis weiter zu verarbeiten.
Die getrennten Teile eines Moduls können mit anderen Headern verschmolzen werden.
Der Linker löst zum Schluss die einzelnen Hinweise in den Headern auf.

 

WORKSPACE:
Master-Detail-Application Vorlage:
Für Apps, die Daten in Form einer Liste anzeigen. 
Typische Beispiele sind die Mail-, SMS- oder Kontake-App.
Die Informationen werden in einer tabellarischen Ansicht angezeigt.
Wählt man eine bestimmte Zelle aus, so wird ein Detail-Formular angezeigt.
Weiterhin ist automatisch ein Navigation-Controller enthalten.
 
Page-Based-Application Vorlage:
Unterschiedliche Inhalte werden immer auf demselben Weg angezeigt.
Gute Beispiele hierfür sind Bücher oder PDF-Dateien und als App iBooks.
Navigiert wird in dieser App, indem man Seiten umschlägt - via Swipe-Geste.
Verwendet im Gegensatz zur Master-Detail-Application keine Navigationbar.

Single-View-Application Vorlage:
Flexibelste Vorlage von allen. 
Nach Anlage eines Projektes erhält man nur ein leeres View.

Tabbed-Application Vorlage:
Wird verwendet, wenn eine App mindestens 2 Views anzeigen soll, 
die über eine Registerlasche aktiviert werden können.
Typische Vertreter sind bspw. die iTunes-Store oder App-Store App.
Der sogenannte Tab Bar Controller bildet den Rahmen der App. 
Am unteren Rand des Tab Bar Controllers sind zwei Schaltflächen
vorhanden, mit denen die beiden integrierten Views aktiviert werden können.

PROJEKT-NAVIGATOR:
Hier werden die Bestandteile eines Projektes aufgelistet.
Die gelben Ordner werden Gruppen genannt und funktionieren 
ähnlich wie die Verzeichnisse im Finder von OS X.
Man kann sich Projektdateien über die Option "Show in Finder" anzeigen lassen.
Dateien können ebenfalls durch Drag & Drop verschoben werden.

GRÖßE DES VIEWS ANPASSEN:
Öffnen des Size-Inspectors 
-> Simulated Size 
-> Freeform: 320/480 
(Merke: View-Controller muss angewählt sein!)

Durch Aktivierung der DEBUG AREA wird am unteren Rand des 
Workspace-Fensters die zweigeteilte Debugger-Ansicht angezeigt.
Der linke Teil ist die Variablenansicht.
Hiermit kann Einblick in die vom Programm verwalteten Daten genommen werden.
Der rechte Bereich ist die Konsole.
Dort erscheinen die Meldungen des Compilers sowie die Ausgaben der Programme.
"Program ended with exit code: 0" bedeutet, dass das Programm ohne Fehler beendet wurde.



DATEITYPEN:
Im Unterschied zu einer Objective-C-Klasse besteht eine 
Swift-Klasse immer nur aus einer Datei und benötigt keinen Header.
Das AppDelegate betrifft den Lebenszyklus einer App.
ViewController-Klassen implementieren das Verhalten zu den Views.
Images.xcassets enthält Grafiken - u.a. das App-Icon.
LaunchScreen enthält den Startbildschirm - bis zum eigentlichen Start der Anwendung.
Sämtliche Variablen und Methoden der Klasse werden in der .swift-Datei programmiert.
Interface-Builder-Dateien enden mit *.storyboard und *.xib
Die eigentliche Projektdatei erhält die Endung .xcodeproj
In Info.plist - einer XML-Datei - werden Konfigurationen zum Projekt festgehalten.



ZERTIFIKATE, PROFILE & IDENTITÄTEN:
Man benötigt mind. 2 Zertifikate: 
Eines für die Entwicklung und eines zur Veröffentlichung von Apps.
Erstellung des für die Entwicklung nötigen Zertifikates:
Hierbei wird ein CSR - Certificate Signing Request - erzeugt.
Diese CSR-Datei muss dann vom Mac hochgeladen werden.
-> Schlüsselbundverwaltung des Mac öffnen
-> Zertifikatsassistent 
-> Zertifikat einer Zertifizierungsinstanz anfordern
Die Datei muss nun im Apple-Developer-Portal hochgeladen werden.
Nach Upload "Generate-Button" im Portal betätigen.
Zertifikat wird nun erzeugt und kann auf den Mac heruntergeladen werden.
Datei in Xcode importieren: Datei via Drag&Drop über dem Xcode-Icon abwerfen.
Dieser Vorgang muss für jedes benötigte Zertifikat wiederholt werden.

Alternativ: Zertifikatsverwaltung automatisch durch Xcode erledigen lassen:
-> XCode -> Preferences-Dialog -> Account


PROVISIONING PROFILE:
Neben den Zertifikaten benötigt man auch ein Provisioning Profile.
Diese Datei enthält alle benötigten Informationen für die Veröffentlichung.
Umfasst u.a. Zertifikate, AppID, IDs der installationsfähigen Geräte.
Hier werden 2 Dateien verwendet: 
Eine zur Entwicklung bzw. Testen der App und eine zur Veröffentlichung.
Damit nicht jedes Mal, wenn eine neue App verteilt werden soll, 
auch ein neues Profil angelegt werden muss, wird eine Vorlagen-Datei erzeugt 
(iOS-Team Profisioning Profile) und zur Erstellung der Profil-Datei verwendet.



GIT-VERSIONSKONTROLLSYSTEM:
XCode unterstützt die Versionierung von Projekten mit dem Git-Versionskontrollsystem.
Über "Source Control" -> "Commit" können Änderungen am Projekt committet werden.
 


UIScreen:
- Ausgangspunkt für alles Grafische innerhalb einer App
- definiert die Eigenschaften des physikalischen Bildschirms (Bsp.: Helligkeit)
 
UIWindow:
- überwacht und koordiniert die im Fenster angezeigten Elemente
- eine App hat typischerweise nur ein Objekt vom Typ UIWindow
 
UIView:
- Basis für die Oberfläche einer App
- innerhalb des Views können Controls (Buttons, TextFields...) eingefügt werden
- kann neben den Controls noch weitere Views enthalten

UIVIewController:
- Verwaltung der Views
- im Storyboard wird jeder ViewController in einer eigenen Scene geführt
- Scenes werden im Document Outline - Fenster angezeigt
 
UINavigationController:
- wird verwendet, um innerhalb einer App eine hierarchische Navigation umzusetzen
 
UIPageController:
- Page-basierende Ansicht (Bsp.: iBooks)
 
UITabBarController:
- Navigation innerhalb einer App
 
UITableViewController:
- Master-Detail-Application
*/



// NSDate:
var datum = NSDate()
print (datum)

let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "dd.MM.yyyy"
let ausgabe = dateFormatter.stringFromDate(NSDate())



// NSRange:
var myString: NSString = "Zeichen in einer Zeichenkette zählen"
var nsRangeValue: NSRange = myString.rangeOfString("einer")
print(nsRangeValue)



// NSTimeInterval:
var zeitspanne = NSTimeInterval()
var currentTime = NSDate.timeIntervalSinceReferenceDate()
var currentTime2 = NSDate.timeIntervalSinceReferenceDate()
zeitspanne = currentTime2 - currentTime



// NSLog:
var hallo = "Hallo"
NSLog("%d", hallo)
var fValue: Float = 123.986
NSLog ("%f",fValue)

for var i = 1 ; i <= 10; i += 1
{ NSLog ("i :\(i)") }



// Swift unterstützt den kompletten UNICODE:
var 😀 = "Smiley"
😀

// Swift ist CASE-SENSITIVE:
let testzahl = 5
let TESTzahl = 5

/* Swift kennt sogenannte Type-Aliases. 
Dabei handelt es sich um zusätzliche Namen für einen gewählten Datentyp,
der anstatt des eigentlichen Namens verwendet werden kann: */

typealias KleineZahlen = UInt8
var kleineZahl: KleineZahlen = 100

/* Dem Schlüsselwort "typealias" folgt ein frei wählbarer Name. 
Mit dem Zuweisungsoperator wird zuletzt der Datentyp zugewiesen,
für den ein Aliasname festgelegt weden soll. 
Type Aliases sind immer dann sinnvoll einsetzbar, wenn der "neue" Name des
Datentyps im Kontext mehr Sinn ergibt als der ursprüngliche Name.


GÜLTIGKEITSBEREICHE:
Die meisten Bezeichner haben einen Gültigkeitsbereich, 
einen sogenannten Scope, der ihre Verwendung einschränkt.
Dieser schützt die Variablen vor unbeabsichtigten Zugriffen 
und der Wert einer Variablen kann besser nachvollzogen werden.
Müssten sämtliche Bezeichnungen in einem Projekt einmalig sein, 
wäre das mit einem erheblichen Aufwand verbunden.
Gültigkeitsbreiche entstehen in Swift automatisch, 
sobald man einen Block aus geschweiften Klammern verwendet. */

// BSP1:
var itemPrice = 5.99
var quantity = 12.0
var totalPrice = itemPrice * quantity
var country = "Frankreich"
if country != "Deutschland"
{   let shippingCosts = 12.99                   // "shippingCosts" wird ausschließlich im Block angesprochen
    totalPrice = totalPrice + shippingCosts
}
print(totalPrice)

// print(shippingCosts)                         // führt zu einem Fehler

// BSP2:
var index = 511
for  index in 0 ..< 10 {
    print(index) }                              // index durchläuft hier die Werte 0 bis 9
print(index)                                    // index besitzt hier den Wert, der vor dem Schleifenblock definiert wurde



//  ZAHLEN:
Int.max
Int.min

Int8.max
UInt8.max
Int8.min
UInt8.min

Int16.max
UInt16.max
Int16.min
UInt16.min

Int32.max
UInt32.max
Int32.min
UInt32.min

Int64.max
UInt64.max
Int64.min
UInt64.min

/* Wie groß der Integer-Wert sein kann, hängt von der Systemarchitektur ab.
Auf einem 32 Bit-System wird ein 32 Bit langes Datenwort verwendet, 
auf einem 64 Bit-System ein 64 Bit langes Datenwort.
Werden explizit kleinere oder größere Datenworte benötigt, 
können statt Int die Datentypen Int8, Int16, Int32 und Int64 verwendet werden.

Der Typ Float ist in jedem System ein 32-Bit Datenwort (6 Stellen), 
Double hingegen immer 64 Bit (15 Stellen) lang. */

var taxtRate:Float = 9.5
var taxtRate2:Double = 9.5

print(DBL_MAX)                                          // Der größte Double-Wert
print(DBL_MIN)                                          // Der kleinste Double-Wert

// CGFloat: 32Bit -> float; 64Bit -> double



// KONSTANTEN:

// In Swift werden Konstanten über den Befehl let erzeugt
let pi = 3.14159265359
let server = "hhtp://sanexio.de"



// ADDITION VON ZAHLENTYPEN:

var a1 = 75
var b1 = 100
var c1 = 5
let sum1 = a1 + b1 * c1
let sum2 = (a1 + b1) * c1


/* IMPLIZITE & EXPLIZITE TYPKONVERTIERUNG:
In der Softwareentwicklung unterscheidet man zwei Arten von Typkonvertierungen.
Bei der IMPLIZITEN KONVERTIERUNG entscheidet der Compiler selbstständig, welcher Typ verwendet werden soll.
Bei einer Addition, die bspw. Int und Double-Typen verwendet, würde sich der Compiler wegen der Genauigkeit für einen Double entscheiden.
Allerdings gibt es keine Regel, dass dies auch so sein muss und Programmiersprachen mit anderen Compilern können sich anders verhalten.
Soll das Ergebnis vom Typ Double sein, muss die Variable a mit Hilfe einer Funktion in einen Double-Typ konvertiert werden.
Mit dieser EXPLIZITEN KONVERTIERUNG wird die Summe auch zu einem Double-Typ. */

var a = 75
var b = 3.8
//  let sum = a + b   -> Addition unterschiedlicher Datentypen führt zu einer Fehlermeldung!
var sumDouble = Double(a) + b

// Soll das Ergebnis ein Integertyp sein, dann verwenden wir die sumInt-Funktion (schneidet Nachkommastellen ab)
var sumInt = a + Int(b)

/* Sollen zwei Int-Werte addiert werden, das Ergebnis aber als Double ausgegeben werden,
so kann die entsprechende Addition in den Klammern der Funktionen programmiert werden.
Damit muss man nicht beide ganzen Zahlen einzeln konvertieren. */
var x = 100
var y = 60
var sumXY = Double(x + y)

// Ähnliches gilt für die Konvertierung von Zahlen in Strings:
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


// Mit der toInt-Funktion lassen sich Zeichenketten in eine Zahl verwandeln:
var optInt = "12345"
var defInt = Int(optInt)

var OptInt: String = "nil"
if let notOptInt = Int(optInt) {
    print("Die Variable enthält: \(notOptInt)")
} else {
    print("Der Inhalt konnte nicht umgewandelt werden.")
}


// Compound Assignments (funktioniert mit allen Basisrechenarten):
var meinInt  = 1
meinInt += 1
meinInt = meinInt + 1

var meinInt2 = 5
meinInt2 *= 2


// Werte runden:
var a2 = 99.49
var r1 = round(a2)  // unter 0.5 wird abgerundet
var a3 = 99.50
var r2 = round(a3)  // ab 0.5 wird aufgerundet

// Nächsthöherer /-niedriger ganzzahliger Wert:
var aValue = 99.001
var c = ceil(aValue)
var f = floor(aValue)

// Größter und kleinster Wert aus einer Menge:
var m1 = 12.34; var m2 = 98.76; var m3 = 87.88; var m4 = 666.6
var maximum = max(m1, m2, m3, m4)
var minumum = min(m1, m2, m3, m4)

// Eine Alternative bieten die beiden Fkt. minElement und maxElement, die jedoch beide eine Auflistung vom Typ Array erwarten:
var zahl1 = 1; var zahl2 = 2; var zahl3 = -3
var Menge = [zahl1, zahl2, zahl3]
var minimum2 = Menge.minElement()
var maximum2 = Menge.maxElement()



// DATENTYP BOOL:
var valueB1:Bool = true
var valueB2 = false



// OPERATOREN / VERGLEICHE:
// <	kleiner als
// >	größer als
// <=	kleiner oder gleich
// >=	größer oder gleich

// ==	Gleichheitsoperator:
        5 == 5

// !=	Ungleichheitsoperator:
        5 != 5
        let istMaennlich = false
        if !istMaennlich { print("ist weiblich") }

// &&	UND Operator:
        let tuerAuf = true; let istWinter = true
        if tuerAuf && istWinter { "Heizung aus" }

// ||	ODER Operator:
        let weihnachten = true
        let ostern = false
        if weihnachten || ostern { "Geschenke" }    // falls die erste Bedingung erfüllt ist, wird die zweite schon nicht mehr geprüft!
        var istKind = true
        if (weihnachten||ostern) && istKind { "Geschenke" }

// +	Addition
// -	Subtraktion
// *	Multiplikation
// /	Division
// %	Restwert-Operator

let wasserTemp = -5
if wasserTemp > 100 { "Wasser verdampft" }
else if wasserTemp == 100 { "Wasser kocht" }
else if wasserTemp >= 50 { "Wasser ist heiß" }
else if wasserTemp >= 30 { "Wasser ist warm" }
else if wasserTemp >= 15 { "Wasser ist normal" }
else if wasserTemp <= 14 { "Wasser ist kalt" }
else { "Wasser verdampft nicht" }
// Die Bedingungen werden von oben nach unten geprüft.
// Trifft eine Bedingung zu, werden die restlichen ausstehenden "else"-Statements nicht mehr geprüft.


// COALESCING OPERATOR: ??

let standardBild = "platzhalter.jpg"
var produktBild: String?

var bild: String
if produktBild != nil {
    bild = produktBild!
} else {
    bild = standardBild
}

// kürzere Schreibweise mit dem Coalescing-Operator:
var coalescingBild = produktBild ?? standardBild



// Gleichheitsoperator ===:
class User {
    var userID = 0
}
var meinUser1 = User()
meinUser1.userID = 1

var meinUser2 = meinUser1
meinUser2.userID = 5

if meinUser1 === meinUser2 {            // Gleichheitsoperator
    "ist der gleiche benutzer"
}



// RANGE OPERATOR:

// Closed Range Operator: Merke: 3 Punkte
for zahl in 1...5 { print("Zahl: \(zahl)") }

// Half-range Operator: Merke: 2 Punkte
let teilnehmer = ["Peter", "Sebastian", "Anna"]
let anzahl = teilnehmer.count
for i in 0..<anzahl { print("Person: \(teilnehmer[i])") }
print(teilnehmer[0...1])
print(teilnehmer[1...2])



/* OPTIONALS:
Einer der größten Unterschiede zwischen Objective-C und Swift ist die Möglichkeit, 
Variablen und Konstanten im Code als optional zu deklarieren.
Ihnen wird damit die Fähigkeit gegeben, alternativ zu einem Wert den Zustand nil anzunehmen.
Ein Optional ist nil, wenn ihm noch kein Wert zugewiesen wurde oder sein Zustand explizit unbestimmt sein soll.
Die Angabe eines Optionals muss explizit erfolgen, da dies der Compiler nicht selbstständig erkennen kann.
Um aus einem regulären Typ einen Optional zu machen, wird dem Datentyp ein Fragezeichen angehängt.
So erfährt der Compiler, dass dieser Wert nil sein darf. */

 var temperatur1:Double = 32.5              // Definition der Temperatur als Double-Wert
 var temperatur2:Double? = 18.2             // Definition der Temperatur als Optional
 print(temperatur1)
 print(temperatur2)

/* Wird ein Optional mit Namen angesprochen, kann man sehen, ob der Optional nil ist oder nicht.
Ist der Zustand nicht nil, muss der Wert "ausgepackt" werden, um an den eigentlichen Wert zu gelangen.
Das geschieht, indem man dem Bezeichner ein Ausrufezeichen anhängt.
Auspacken sollte man aber nur, wenn sicher ist, dass der Wert nicht nil ist, 
ansonsten führt der Versuch direkt zu einem Fehler. */

var temperaturA:Double? = 18.2
if temperaturA == nil { print("Keine Messung") } else { print( temperaturA!) }

/* OPTIONAL-BINDING:
Ein anderer Weg, einen Optional auf nil zu testen und auszupacken, funktioniert über ein Verfahren, 
das in Swift als Optional-Binding bezeichnet wird.
Dabei wird der Optional in einer "if let" oder "if var" -Struktur einem neuen Wert zugewiesen.
Ist die Zuweisung erfolgreich, ist der Wert also nicht nil, wird der Wert über die Variable ausgegeben.
Diese kann allerdings nur innerhalb der if-Struktur verwendet werden. */

 var temperaturB:Double? = nil
 if var temp = temperaturB
 { print(temp) } else { print("Keine Messung") }

var str : String? = "hello"
if str != nil { str!.appendContentsOf(" world ") }

// Verkürztes Optional-Binding:
str?.appendContentsOf(" world ")

var myOptInt:Int? = nil
if myOptInt != nil {
    print("Enthält einen Wert")
} else {
    print("Enthält nil")
}


/* Implicitly Unwrapped Optionals:
Hin und wieder weiß man genau, dass in einer Variable mit Sicherheit ein Wert enthalten ist.
Allerdings findet zu Beginn des Programms noch keine Initialisierung der Variablen statt, 
weil z.B. einfach noch kein Wert zur Initialisierung vorhanden ist. 
Das kann bspw. der Fall sein, wenn ein Programm geladen wird, bevor dessen Oberfläche startet. 
In einem solchen Fall ist unter Umständen nicht bekannt, wie groß die einzelnen Controls gezeichnet
werden müssen, z.B. bei Apps für das iPhone und iPad. Spätestens wenn die Oberfläche der App gezeigt wird, 
ist mit Sicherheit die Breite und Höhe eines Controls bekannt und kann dann auch zugewiesen werden.
In solchen Fällen wird eine Variable als Implicitly Unwrapped Optional gekennzeichnet.
Die Variable wird hier anstelle eines Fragezeichens mit einem Ausrufezeichen gekennzeichnet. */
        
var buttonWidth : CGFloat!



// DATENTYP STRING:

let dontModifyMe = "You cannot modify this string"
var modifyMe = "You can modify this string"
modifyMe = "changed"


// ZUSAMMENFÜGEN VON ZEICHENKETTEN:

var firstName = "Georg"
var lastName = "Freitag"
var fullName = "Mein Name ist " + firstName + " " + lastName + "."

let messageFirst = "Swift is awesome. "
var messageSecond = "What do you think?"
var messageCombined = messageFirst + messageSecond  // Auch die Typen "let" und "var" können kombiniert werden.


//  STRING INTERPOLATION:

// Variablennamen werden in \() eingebettet und direkt in eine neue Zeichenkette geschrieben:
var interpolatedFullName = "Mein Name ist \(firstName) \(lastName)."

var price = 1.339; var liter = 8.5
// der Compiler kann auch Rechenoperationen innerhalb der Klammern auszuführen
var total = "\(liter) Liter zu \(price) kosten \(price * liter) €"


// FORMAT-SPECIFIER:

var totalFormatted
// mit "format" und sog. Format-Specifier werden dem Compiler Formatierungen mitgeteilt:
    = String(format: "%.2f Liter zu %.2f kosten %.2f €", liter, price, liter * price)
    // Format-Specifier beginnen immer mit einem %; mit "%.2f" werden 2 Nachkommastellen definiert.

var personName = "Max Müller"; var age3 = 54
var description
    = String(format: "Mein Name ist %@. Ich bin %i Jahre alt", personName, age3)
    // %i: Platzhalter für eine ganze Zahl; %@: Platzhalter für Objekttypen wie String


//  ZEICHENKETTEN ANALYSIEREN:

var empty = fullName.isEmpty                            // Enthält die Zeichenkette ein Zeichen?
var charCount = fullName.characters.count               // Wieviele Zeichen enthält der String?

// Vergleich von Zeichenketten auf Gleichheit mit dem "=="-Operator:
var aFirstName = "Petra"; var aLastName = "Schubert"
if aFirstName + " " + aLastName == "Petra Schubert"
    { print("Die Zeichenketten sind gleich") }
else
    { print("Die Zeichenketten sind ungleich") }

/* Bei der folgenden Überprüfung soll die Groß- und Kleinschreibung ignoriert werden.
Hierbei kommt die compare-Methode von Strings zum Einsatz.
Hierbei werden zwei Parameter eingesetzt: NSStringCompareOptions und CaseInsentiveSearch.
Das Ergebnis dieses Vergleichs ist dann kein boolscher Wert sondern ein NSComparisonResult */
var value1 = "Dortmund"; var value2 = "Bochum"
var comparisonResult:NSComparisonResult = value1.compare(value2, options: NSStringCompareOptions.CaseInsensitiveSearch)
if comparisonResult == NSComparisonResult.OrderedSame
    { print("Die Zeichenketten sind gleich") }
else if comparisonResult == NSComparisonResult.OrderedAscending
    { print("\(value1) kommt vor \(value2).") }
else if comparisonResult == NSComparisonResult.OrderedDescending
    { print("\(value2) kommt vor \(value1).") }

// upperCaseString: Großbuchstaben;  lowercaseString: Kleinbuchstaben:
var city1 = "Frankfurt"; var city2 = "frankFurt"
var city1Upper = city1.uppercaseString; var city2Upper = city2.uppercaseString;
if city1Upper == city2Upper
    { print("Die Zeichenketten sind gleich") }
else
    { print("Die Zeichenketten sind unterschiedlich") }


//  TEXTABSCHNITTE FINDEN UND ERSETZEN:

// Die Überprüfung, ob ein Text eine Zeichenkette enthält, erfolgt mit der METHODE "RANGEOFSTRING"
// Der Rückgabewert der Methode rangeOfString ist ein Optional vom TYP "RANGE" (Menge aufeinanderfolgender diskreter Werte):
var city = "Hamburg"; var search = "burg"
if city.rangeOfString(search) != nil
    { print("Gesuchte Zeichenfolge ist enthalten") }


// STARTINDEX + ENDINDEX: ab welcher Position stimmt die gesuchte Zeichenkette mit dem Text überein
var range = city.rangeOfString(search, options: NSStringCompareOptions.CaseInsensitiveSearch)
if let validRange = range   // Optional-Binding: Optional "range" wird in den Range-Typ validRange konvertiert.
{
    print("Startindex: \(validRange.startIndex)")
    print("Endindex: \(validRange.endIndex)")}
else
    {print("Die gesuchte Zeichenfolge ist nicht enthalten")}


/* ZEICHEN ERSETZEN:
Sollen Zeichen durch andere ersetzt werden, kann man die METHODE "stringByReplacingOccurrencesOfString" verwenden.
Der Austausch findet jedoch nicht sofort statt, sondern wir erhalten als Rückgabe des Methodenaufrufes einen neuen Text.
Diesen können wir anschließend derselben Variablen zuweisen */
var greetings = "Hallo Objective-C-Entwickler!"
greetings = greetings.stringByReplacingOccurrencesOfString("Objective-C", withString: "Swift")
greetings = greetings.stringByReplacingOccurrencesOfString("hallo", withString: "Guten Tag", options: NSStringCompareOptions.CaseInsensitiveSearch)


/* WHITESPACE (Tabulatoren, Zeilenumbrüche oder zusätzliche Leerzeichen) können innerhalb der Programmlogik zu Problemen führen.
Ein String mit einem zusätzlichen Whitespace unterscheidet sich vom gleichen Text ohne Whitespace.
"stringByTrimmingCharactersInSet" mit dem NSCharacterSet "whitespaceCharacterSet" entfernt Whitespace und lässt einen bereinigten String zurück */
var whitespaceString = "              Mein Name is Andreas"
var normalString = whitespaceString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())


// ZAHLEN ENTFERNEN:
var whitespaceAmount = "Der Rechnungsbetrag ist: 199,44"
var normalAmount1 = whitespaceAmount.stringByTrimmingCharactersInSet(NSCharacterSet.decimalDigitCharacterSet())
// Soll die Zahl innerhalb eines String freigestellt werden, erweitert man den gleichen Aufruf um die Eigenschaft "invertedSet":
var normalAmount2 = whitespaceAmount.stringByTrimmingCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)


// ZEICHENKETTEN IN ZAHLENTYPEN KONVERTIEREN:

// GANZE ZAHLEN:
var numericStringValue = "233"
var numericIntValue = Int(numericStringValue)
// Die Ausgabe von numericintValue ist ein Optional und kann nil sein (Bsp. oben testen mit "123" = "einzweidrei")

// DEZIMALZAHLEN: Hier muss der Compiler die Landeseinstellung kennen, da bspw. in D Dezimalzahlen durch Kommata getrennt werden, in den USA durch Punkte
var numberValue:String = "120,3456"
var formatter = NSNumberFormatter()                             // Zunächst muss ein "NSNumberFormatter" erzeugt werden
formatter.locale = NSLocale(localeIdentifier: "de_DE")          // mit der Eigenschaft "locale" wird die Region festgesetzt
formatter.minimumFractionDigits = 2                             // mit der Eigenschaft "minimumFractionDigits" wird die minimale Anzahl der Dezimalstellen festgesetzt
formatter.maximumFractionDigits = 2                             // mit der Eigenschaft "maximumFractionDigits" wird die maximal Anzahl der Dezimalstellen festgesetzt
var number:NSNumber? = formatter.numberFromString(numberValue)  // Methode "numberFromString" liefert einen Optional, der nil ist, wenn die Umwandlung misslingt

if let validNumber = number
{var newNumberValue = formatter.stringFromNumber(validNumber)}  // "stringFromNumber": Rückkonvertierung; 2 Nachkommastellen; Aufrundung

// TIPP: Bei Zeichenketten, die zusätzlich Buchstaben enthalten, sollte der String mit"stringByTrimmingCharactersInSet" bereinigt werden.


/* DIE KLASSE NSNUMBER:
NSNumber wird in Objective-C verwendet, weil die einfachen Datentypen der Sprache C nicht in einem Objective-C-Array verwendet werden können.
Das funktioniert ausschließlich mit Objekten, weil diese mit Speicherzeiger arbeiten. In Swift gibt es diese Einschränkung nicht.
NSNumber bleibt dennoch ein vielseitige Klasse, weshalb sie auch in Swift weiterhin Verwendung findet */

var numValue:NSNumber = 4.501                           // NSNumber mit einer Dezimalzahl anlegen
var intValue:Int = numValue.integerValue                // Die ganze Zahl des Wertes abrufen
var numValue2:NSNumber = 4                              // NSNumber als eine ganze Zahl anlegen
var doubleValue:Double = numValue2.doubleValue          // Den Wert als Dezimalzahl abrufen
var numValue3:NSNumber = 0
var boolValue:Bool = numValue3.boolValue                // Den Wert als boolschen Typ abrufen; Wert 0 = false; jede andere Zahl ergibt true


/* TEXTE TEILEN
Nehmen wir an, wir möchten aus dem HTML-Quelltext einer Webseite den Titel der Seite ermitteln.
Erkennen kann man den Titel meist an den Tags <title> und </title>, von denen er umschlossen ist.
Mit dem folgenden Listing kann man diesen Text herauslesen. */

let startTag = "<title>"
let endTag = "</title>"
var pageTitle = ""
var htmlSource = "Html Quelltext <title>Meine Webseite</title> Mehr Html Quelltext"
               //123456789012345678901234567890
               //         10        20        30

// Zunächst wird mit der Methode "rangeOfString" die Range für den Tag <title> innerhalb des Strings htmlSource gesucht:
var startRange = htmlSource.rangeOfString(startTag, options: NSStringCompareOptions.CaseInsensitiveSearch)

// Ist startRange nicht nil, wurde der Tag im Text gefunden
if startRange != nil
{
    // TEXT NACH DEM ÖFFNENDEN TAG EXTRAHIEREN:
    // Durch die Methode "substringFromIndex" wird eine neue Zeichenkette gebildet
    // Sie beginnt dort, wo in htmlSource der gesuchte <title>-Tag endet. Das wird durch die Angabe von "startRange!.endIndex" realisiert
    // Damit wird der Anfang der Webseite abgeschnitten
    pageTitle = htmlSource.substringFromIndex(startRange!.endIndex)
    
    var endRange = pageTitle.rangeOfString(endTag, options: NSStringCompareOptions.CaseInsensitiveSearch)
    if endRange != nil
    {
        // TEXT BIS ZUM SCHLIEßENDEN TAG FREISTELLEN
        // Enden soll die Zeichenkette an der Stelle, an welcher der schließende Tag </title> zu finden ist
        pageTitle = pageTitle.substringToIndex(endRange!.startIndex)
    }
}
print(pageTitle)

// Mit der Methode "indices" wird ein Bereich erzeugt, welcher der kompletten Länge eines übergebenden Strings entspricht:
var myProfession = "Ich bin Softwareentwickler."
// Eine Range anlegen, die den gesamten String beinhaltet
var myRange = myProfession.characters.indices

// Mit der Methode "distance" wird die Länge einer Range ermittelt:
// Wie lang ist der Bereich von start bis end?
var lengthOfString = myRange.startIndex.distanceTo(myRange.endIndex)
print("Die Range ist \(lengthOfString) Zeichen lang.")


/* Benötigt man eine Variable oder Konstante, die genau ein Zeichen aufnehmen kann, bietet sich der Typ "Character" an.
Bei der Deklaration eines "Character" muss man explizit angeben, dass man diesen Typ verwenden möchte.
Die Type-Inference des Compilers würde ansonsten auch für Zeichenketten, die nur ein Zeichen lang sind, den Typ "String" einsetzen */

var x1 = "X"                                // Das ist ein String
var x2: Character = "X"                     // Das ist ein Character

// Swift verwendet für sämtliche Texte Unicode, die über ihren Code angegeben werden können:
var earth = "\u{1F30D}"

/* Unicode-Zeichen sind nicht alle gleich lang, oder genauer gesagt, sie benötigen unterschiedlichen Speicherplatz.
Während man bei den gebräuchlichsten Zeichen mit 16 Bit auskommt, kann ein Emoji 32 Bit belegen.
Aus diesem Grund ist es nicht möglich, einfach über die Indexposition auf ein Zeichen innerhalb der Zeichenkette zuzugreifen. */
var planet = "Earth \u{1F30D}"
/* Das bei vielen anderen Programmiersprachen beliebte Subscripting, um einen "Character" aus dem Text auszulesen, funktioniert in Swift mit Integer nicht:
Die Eingabe von "var symbol = planet[2]" liefert unter Swift einen Fehler.
Möchte man ein Zeichen an einer beliebigen Position aus dem Text auslesen, benötigt man keinen Int-Typ, sondern einen "String.Index".
Dieser wird am einfachsten aus einer Range der betreffenden Zeichenkette erstellt. */
var planetRange = planet.characters.indices
/* Die Eigenschaft "startIndex" eines Bereiches verweist auf das ERSTE Zeichen im Text,
während "endIndex" die Position NACH dem LETZTEN Zeichen angibt.
Das erste Zeichen der Zeichenkette "planet" soll ausgelesen werden. */
var planetFirst = planet[planetRange.startIndex]                            // startIndex & endIndex sind vom Typ "String.Index"

// var planetLast = planet[planetRange.endIndex]                            // liefert eine Fehlermeldung ?

var offset1 = 6
var offset2 = 1

// Mit der Funktion "advance" läßt sich ein Typ "Sting.Index" erzeugen, der um eine beliebige Anzahl von Zeichen von "startIndex" verschoben ist:
var stringIndex1 = planetRange.startIndex.advancedBy( offset1 )                   // Eine Position, um "offset1"-Zeichen entfernt vom StartIndex

// Soll die Position vom Ende der Zeichenkette her gezählt werden, kann "advance" mit "endIndex" und einer negativen ganzen Zahl verwendet werden:
var stringIndex2 = planetRange.endIndex.advancedBy( -offset2 )                    // Eine Position, um "offset2"-Zeichen entfernt vom EndIndex

var symbol1:Character = planet[stringIndex1]
var symbol2:Character = planet[stringIndex2]

// Subscripting mit dem Typ String.Index funktioniert nicht nur mit einzelnen Zeichen, sondern auch mit ganzen Abschnitten:
var blindText
    = "Franz jagt im komplett verwahrlosten Taxi quer durch Bayern."
//     1234567890123456768901234567890123456789012345678901234567890
//              10         20        30        40        50        60
var blindRange = blindText.characters.indices

// Der Text zwischen den Positionen 23 und 35
var substring
    = blindText[blindRange.startIndex.advancedBy(23)
        ... blindRange.startIndex.advancedBy(35)]

/* ANFANG UND ENDE VON ZEICHENKETTEN AUSSCHNEIDEN:
Mit den Funktionen "prefix" und "suffix" können ebenfalls Abschnitte aus einer Zeichenkette extrahiert werden.
"prefix" liefert eine Anzahl von Zeichen vom Anfang einer Zeichenkette und "suffix" Zeichen vom Ende des Textes.
Wird für die Anzahl der Zeichen eine Wert angegeben, der größer als die Länge des Strings ist, erhält man den kompletten String. */

var demoText = "Falsches Üben von Xylophonmusik quält jeden größeren Zwerg."
//              12345678                                             654321

// Die ersten acht Zeichen:
var pre = String(demoText.characters.prefix(8))
// Die letzten sechs Zeichen:
var sub = String(demoText.characters.suffix(6))

// Benötigt man nur das erste oder letzte Zeichen, verwendet man die Fkt. "first" und "last":
var xylophon = "Xylophonmusik"
var firstChar:Character? = xylophon.characters.first
var lastChar:Character? = xylophon.characters.last

// Mit den Fkt. "dropFirst" & "dropLast" lässt sich das erste bzw. letzte Zeichen entfernen:
var firstDroped = String(xylophon.characters.dropFirst())                                       // Das erste Zeichen entfernen
var lastDroped = String(xylophon.characters.dropLast())                                         // Das letzte Zeichen entfernen

// ANWENDUNGSBEISPIEL:
var reform =  "reChtSchreiBrEforM"
var firstChr = reform.characters.first
reform = String(reform.characters.dropFirst())
// Zeichenkette neu zusammensetzen
reform = "\(String(firstChr!).uppercaseString)"
    + "\(reform.lowercaseString)"



// Initialisieren & Deinitialisieren:

struct Player {
    var nick: String
    
    // designated initializer
    init(nickname: String) {
        self.nick = nickname
    }
    
    // convenience initializer
    init() {
        self.init(nickname: "anonymous")            // greift auf designated initializer zurück
    }
}
var meinPlayer = Player(nickname: "Siggi")
print(meinPlayer)
var unnamedPlayer = Player()
print(unnamedPlayer)


class PLAYER {
    var nick: String
    
    // designated initializer
    init(nickname: String) {
        self.nick = nickname
    }
    
    // convenience initializer
    convenience init() {                            // bei Klassen muss der Convenience-Initializer explizit (KeyWord) angegeben werden!
        self.init(nickname: "anonymous")
    }
}

class TeamPlayer: PLAYER {
    var teamName: String
    
    init(nick: String, team: String) {
        self.teamName = team
        super.init(nickname: nick)
    }
}


// Failable Initializer (können nil zurückgeben):

struct HttpClient {
    var httpHost: String
    
    init?(host: String) {
        if host.isEmpty {
            return nil
        }
        self.httpHost = host
    }
}
