// update: 10.07.16, 12:30
import UIKit

// Property Observer:

struct MeinKörper {
    var gewicht:Double {
        willSet(newGewicht) {
            print("setze gleich ein neues Gewicht: \(newGewicht)")
        }
        didSet {
            let differenz = gewicht - oldValue
            print("Differenz: \(differenz)")
        }
    }
}

var fettwannst = MeinKörper(gewicht: 102.7)
fettwannst.gewicht = 105
fettwannst.gewicht = 70


// Type Property (Statische Eigenschaften):

struct  DBAdapter {
    static var maxConnections = 3
}

var meineDB = DBAdapter()
// meineDB.maxConnections -> funktioniert nicht, da durch "static" die Eigenschaft 
// nur innerhalb der Klasse und nicht innerhalb einer Instanz abrufbar ist.
DBAdapter.maxConnections



// Lazy stored Properties:

class XMLParser {
    init() {
        print("initialisiert")
    }
    
    func parse(xml: String) {
        print(xml)
    }
}

class XMLProcessor {
    lazy var xmlParser = XMLParser()    //
    
    func downloadXML() -> String {
        return "XML heruntergeladen"
    }
    
    func process() {
        let xml = downloadXML()
        xmlParser.parse(xml)
    }
}

let processor = XMLProcessor()
// processor.process()                  // Erst durch Aufruf der Fkt. process wird durch "lazy var xmlParser" die Klasse XMLParser angesprochen



// Computed Properties:

struct Product {
    var ekPreis = 0.0
    var vkPreis: Double {
        get {                           // lesender Zugriff auf die Eigenschaft
            return ekPreis * 1.45
        }
        set(neuerVk) {                  // schreibender Zugriff auf die Eigenschaft
            ekPreis = neuerVk / 1.45
        }
    }
}
var meinProdukt = Product(ekPreis: 10)
meinProdukt.ekPreis
meinProdukt.vkPreis

meinProdukt.vkPreis = 20
meinProdukt.ekPreis


