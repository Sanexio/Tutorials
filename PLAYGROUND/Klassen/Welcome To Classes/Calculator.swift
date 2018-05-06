//
// Calculator.swift

// Da mit Gettern und Settern bel. Anweisungen programmiert werden können, lassen sich Klassen flexibel gestalten.
// Durch die Zuweisung einer Eigenschaft können weiterer Code ausgeführt oder andere Eigenschafte/Werte aktualisiert werden.


import Foundation

public class Calculator
    {
    public var product:Double = 0.0                         // Öffentliches Produkt
    
    private var fact1:Double = 0.0                          // Private Faktoren
    private var fact2:Double = 0.0
    
    public var factor1:Double                               // Öffentlicher Faktor
        {
            get {return self.fact1}
            set (f)
            {
                // Das Produkt wird neu berechnet sobald einem Faktor ein neuer Wert zugewiesen wird:
                self.fact1 = f
                self.product = self.fact1 * fact2
            }
        }

    public var factor2:Double                               // Öffentlicher Faktor
        {
            get {return self.fact2}
            set (f)
            {
                // Das Produkt wird neu berechnet sobald einem Faktor ein neuer Wert zugewiesen wird:
                self.fact2 = f
                self.product = self.fact1 * fact2
            }
        }
    }

// Die Instanziierung und Zuweisungen der Eigenschaften werden in der Datei main.swift vorgenommen.
// Von außerhalb der Klasse nicht erkennbar, wird die Eigenschaft product sofort neu berechnet,
// wenn factor1 oder factor2 ein neuer Wert zugewiesen wird.

// Werden für eine Eigenschaft Getter und Setter implementiert, benötigt man ein zusätzliche Instanzvariable, in welcher der Wert abgelegt wird.
// Im Bsp. sind dies die privaten Variablen fact1 und fact2 für die öffentlichen Eigenschaften factor1 und factor2.
// Bei der Programmierung mit Swift kann man auf diesen zusätzlichen Aufwand verzichten,
// indem man in den Eigenschaften statt Getter und Setter, Property-Observers implementiert.
// Diese treten ebenfalls als Paar auf und heißen willSet und didSet.
// Der Code von willSet wird aufgerufen, bevor der Eigenschaft ein neuer Wert zugewiesen wird,
// didSet erst, nachdem die Zuweisung bereits vollzogen wurde.
// Um das Produkt der beiden Faktoren neu zu berechnen, genügt uns ein didSet.
// Die Klasse Calculator kann ohne Verwendung von privaten Instanzvariablen wie folgt geändert werden.
// In der Datei main.swift müssen keine Änderungen vorgenommen werden.

/*
 public class Calculator
 {
        public var product:Double = 0.0                         // Öffentliches Produkt
 
        public var factor1:Double = 0.0                         // Öffentliche Faktoren
        {
            didSet
            {
                // Das Produkt wird neu berechnet sobald einem Faktor ein neuer Wert zugewiesen wird:
                self.product = self.factor1 * self.factor2
            }
        }
 
 public var factor2:Double = 0.0
 {
        didSet
        {
                self.product = self.factor1 * self.factor2
        }
 }
 }
*/
