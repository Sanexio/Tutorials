//  main.swift


import Foundation


var pers = Person()                                             // Ein Objekt der Klasse Person instanziieren

pers.firstName = "Max"                                          // Den Eigenschaften Werte zuweisen
pers.lastName = "Müller"
pers.age = 32

print("Mein Name ist \(pers.firstName) \(pers.lastName).")      // Ausgabe der Werte
print("Ich bin \(pers.age) Jahre alt.")
print("Ich bin \(pers.ageInDays) Tage alt.")


if(pers.firstName.isEmpty)                                      // Verkettung von Eigenschaften, um einen Zustand abzufragen
{
    print("Es wurde kein Vorname zugewiesen.")
}

var calc = Calculator()                                         // Eine Instanz der Klasse anlegen
calc.factor1 = 5.4
calc.factor2 = 2.6

print("Das Produkt ist: \(calc.product)")                       // Ausgabe des Ergebnisses


var heidi = Person()                                            // Ein Objekt der Klasse Person instanziieren
heidi.firstName = "Heidi"
heidi.lastName = "Schubert"
heidi.age = 32


heidi.lastName = "Schulz"                                       // Ein neuer Nachname


