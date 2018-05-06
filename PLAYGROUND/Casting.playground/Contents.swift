// CASTING
// update: 26.07.16; 12:00

protocol Fahrzeug {
    var marke: String {get set}
    
    func beschleunigen()
}

class Auto: Fahrzeug {
    var marke = "BMW"
    func beschleunigen() {
    }
    func motorStarten() {
    }
}

class Fahrrad: Fahrzeug {
    var marke = "Puky"
    func beschleunigen() {
    }
    func klingeln() {
    }
}

// Implizites Casting:

var meinKlassenAuto: Auto
meinKlassenAuto = Auto()
meinKlassenAuto.marke
meinKlassenAuto.motorStarten()
meinKlassenAuto.beschleunigen()

var meinKlassenFahrrad: Fahrrad
meinKlassenFahrrad = Fahrrad()
meinKlassenFahrrad.marke
meinKlassenFahrrad.klingeln()
meinKlassenFahrrad.beschleunigen()


var meinProtokollAuto: Fahrzeug
meinProtokollAuto = Auto()
meinProtokollAuto.marke
// meinProtokollAuto.motorStarten()         -> führt zu einem Fehler!
meinProtokollAuto.beschleunigen()

var meinProtokollFahrrad: Fahrzeug
meinProtokollFahrrad = Fahrrad()
meinProtokollFahrrad.marke
// meinProtokollFahrrad.klingeln()          -> führt zu einem Fehler!
meinProtokollFahrrad.beschleunigen()

/* Bei Verwendung des Protokolls kann nur auf den kleinsten 
gemeinsamen Nenner zugegriffen werden:
In diesem Fall ist das die Marke und die Fkt "beschleunigen".
Die Funktionen der Klassen sind im Protokoll nicht bekannt.
Auch wenn die Variable mit der Klasse initialisiert wird,
wird nur auf die im Protokoll definierten Eigenschaften zugegriffen.*/



// Typ als Parameter:
func fahrzeugBeschleunigen(fahrzeug: Fahrzeug) {
    fahrzeug.beschleunigen()
    fahrzeug.marke
}



// AS-Operator (direktes Casting):

class Tier {
    func tierisch() {
    }
}
class Hund: Tier {
    func bellen() {
    }
}
class Katze: Tier {
    func schnurren() {
    }
}

let meinHund: Tier = Hund()                 // auf alle Eigenschaften in der Klasse Tier kann zugegriffen werden
meinHund.tierisch()                         // zusätzliche Eigenschaften in der Klasse Hund werden nicht berücksichtigt
let wirklicherHund = meinHund as! Hund      // mit as! wird nun auf die Eigenschaften des Hundes zugegriffen
wirklicherHund.tierisch()
wirklicherHund.bellen()



// NSArray => AnyObject:
let meineHunde: [AnyObject] = [
    Hund(), Hund(), Hund()
]
for hund in meineHunde {
    // hund.xxx -> es kann weder auf "bellen" noch auf "tierisch" zugegriffen werden!
    let tmpHund = hund as! Hund
    tmpHund.bellen()
    tmpHund.tierisch()
}


let meineAnderenHunde: [AnyObject] = [
    Katze(), Katze(), Katze()
]
for hund in meineAnderenHunde {
    let tmpHund = hund as? Hund     // Versuch der Umwandlung, sonst nil
 // let tmpHund = hund as! Hund     // forced unwrapping funktioniert nicht, da eine Katze kein Hund ist!
}