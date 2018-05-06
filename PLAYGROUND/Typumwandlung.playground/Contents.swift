import UIKit

// Typüberprüfung mit dem is-Operator:

class Person {
    var nachname: String
    var vorname: String
    
    init(nachname:String, vorname: String) {
        self.nachname = nachname
        self.vorname = vorname
    }
}

class Mitarbeiter : Person {}

class Angestellte : Mitarbeiter {}

class Arbeiter : Mitarbeiter {}

var array = [
    Angestellte(nachname: "Müller", vorname: "Raöf"),
    Arbeiter(nachname: "Klein", vorname: "Olaf"),
    Arbeiter(nachname: "Banat", vorname: "Andre"),
    Arbeiter(nachname: "Leinung", vorname: "Fiat 500"),
    Angestellte(nachname: "Meier", vorname: "Mustermann")
    ]

var angestellteZähler = 0
var arbeiterZähler = 0

for element in array {
    if element is Arbeiter {
        arbeiterZähler+=1
    }
    if element is Angestellte {
        angestellteZähler+=1
    }
}



// Downcasting:

class PERSON {
    var nachname: String
    var vorname: String
    
    init(nachname:String, vorname: String) {
        self.nachname = nachname
        self.vorname = vorname
    }
}

class MITARBEITER : Person {
    var PersonalNummer = 1234
}

class ANGESTELLTE : MITARBEITER {}

class ARBEITER : MITARBEITER {}

var ARRAY = [
    ANGESTELLTE(nachname: "Müller", vorname: "Raöf"),
    ARBEITER(nachname: "Klein", vorname: "Olaf"),
    ARBEITER(nachname: "Banat", vorname: "Andre"),
    ARBEITER(nachname: "Leinung", vorname: "Fiat 500"),
    ANGESTELLTE(nachname: "Meier", vorname: "Mustermann")
]

for element in ARRAY {
    let mitarbeiter = element as MITARBEITER
    print(mitarbeiter.PersonalNummer)
}
// Mit dem as-Operator wird so einfach jedes im Array enthaltene Objekt als Mitarbeiter-Objekt betrachtet,
// unabhängig vom wirklichen Typ, und die Personalnummer kann zusätzlich ausgegeben werden.
// Eine Alternative dazu ist die Erweiterung des as-Operators um einen Optional-Operator:
for element in ARRAY {
    if let arbeiter = element as? ARBEITER {
        print(arbeiter.PersonalNummer)
    }
    if let angestellte = element as? ANGESTELLTE {
        print(angestellte.PersonalNummer)
    }
}
// der as?-Operator wird für den Fall verwendet, dass eine Umwandlung nicht möglich ist.
// Bei einem expliziten Downcast ist es erforderlich, den Operator as in Verbindung mit einem "!" zu gebrauchen.
// Dem Entwickler soll dieser Hinweis mitteilen, dass diese Umwandlung auch fehlschlagen und somit die App 
// zum Absturz bringen kann.



// AnyObject:

let objekte: [AnyObject] = [
    Angestellte(nachname: "Müller", vorname: "Raöf"),
    Arbeiter(nachname: "Klein", vorname: "Olaf"),
    Arbeiter(nachname: "Banat", vorname: "Andre"),
    Arbeiter(nachname: "Leinung", vorname: "Fiat 500"),
    Angestellte(nachname: "Meier", vorname: "Mustermann")
]

// Any:

var allesfresser = [Any]()
allesfresser.append(1234567)
allesfresser.append("Hallo Welt")
allesfresser.append(3.14)
allesfresser.append(Angestellte(nachname: "Nr2", vorname: "Olaf"))
allesfresser.append(Arbeiter(nachname: "Leinung", vorname: "Fiat 500"))

// Instanzen müssen vor weiterer Verwendung wieder in den entsprechenden Typen umgewandelt werden:

for Element in allesfresser {
    switch Element {
        case let einInt as Int:
            print("Das ist ein Integer: \(einInt)")
        case let einString as String:
            print("Das ist ein String: \(einString)")
        case let einDouble as Double:
            print("Das ist ein Double: \(einDouble)")
        case let einAngestellter as Angestellte:
            print(einAngestellter.nachname + " " + einAngestellter.vorname)
        case let einArbeiter as Arbeiter:
            print(einArbeiter.nachname + " " + einArbeiter.vorname)
        default:
            print("Nicht gefunden!")
    }
}

