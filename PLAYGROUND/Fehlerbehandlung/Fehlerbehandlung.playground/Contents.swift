// ExceptionHandling


// update 22.8.16, 13:30
import UIKit
import Foundation

enum RSSParserErrors: ErrorType {
    case ServerUnrechable
    case HostNotFound
    case InvalidXML
}

func getRSSPosts() throws {
    // aufbau der verbindung ..
    throw RSSParserErrors.HostNotFound
}

func showPosts() {                              // do-try-catch - Block
    do {
        try getRSSPosts()
    } catch RSSParserErrors.HostNotFound {
        print("Host nicht gefunden", true)
    } catch RSSParserErrors.InvalidXML {
        print("XML ungültig", true)
    } catch {
        print("Fehler... \(error)", true)
    }
}


enum Druckerfehler: ErrorType {
    
    case Papierstau
    case Tinteleer
    case Stromaus
}

class Drucker {
    
    func print(dokument: String) throws {
        // ....
        throw Druckerfehler.Papierstau
    }
}

let canon = Drucker()

do {
    try canon.print("hilfe.pdf")
} catch Druckerfehler.Papierstau {
    print("Druckerfehler: Papierstau")
} catch Druckerfehler.Tinteleer {
    print("Druckerfehler: Tinteleer")
} catch Druckerfehler.Stromaus {
    print("Druckerfehler: Stromaus")
} catch {
    print("Unbekannter Fehler")
}

