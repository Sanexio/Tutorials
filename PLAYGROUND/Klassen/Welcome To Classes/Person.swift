//
//  Person.swift


import Foundation

public class Person
{
    public var lastName:String = ""
    {
        willSet(lastName)
        {
            print("Der Name \(lastName) soll zugewiesen werden.")
            print("Der Name lautet bisher: \(self.lastName)")
        }
        didSet
        {
            print("Der Name \(self.lastName) wurde zugewiesen.")
            print("Der Name lautet bisher: \(oldValue)")
        }
    }
    
    public var firstName:String = ""
    public var age:Int = 0
    
    public var ageInDays:Int                                                // Das Alter der Person in Tagen
        
        
// "ageInDays" verfügt über einen Getter, in dem Anweisungen ausgeführt werden, wenn auf die Eigenschaft zugegriffen wird.
// In unserem Bsp. ist das eine Multiplikation.
// Wichtig ist der Befehl "return", ohne den das Rechenergebnis nicht zurückgegeben wird.
// Beim Zugriff auf die Eigenschaft können wir ebenfalls die Punktnotation verwenden.
// Von außerhalb der Klasse ist nicht zu erkennen, ob es sich bei "ageInDays" um eine Instanzvariable handelt, oder ob der Wert bei jedem Zugriff immer neu berechnet wird.
        
    {
        get { return self.age * 365}                                        // Getter um den Wert zu lesen
        
// An dieser Stelle wird der Compiler beim Versuch, "ageInDays" einen Wert zuzuweisen, einen Fehler ausgeben.
// Der Grund hierfür liegt nicht in der nachfolgenden Berechnung, sondern darin, dass dass nur ein Getter implementiert wird.
// Dieser liest nur Werte aus - die Eigenschaft ist bis hier "nur lesbar" oder "read only"
// Soll der Wert von ageInDays gesetzt werden, müssen wir die Eigenschaft zusätzlich um einen Setter erweitern.
        
        set (days)                                                          // Setter um den Wert zu schreiben
        {
            if days < 0
            {
                self.age = 0
            }
            else
            {
                self.age = days / 365
            }
        }
    }
}

// Gibt es für eine Eingenschaft einen Setter, gibt es in den meisten Fällen eine Variable, in welcher der Wert abgelegt werden kann.
// Bei der Klasse Person wird die Eigenschaft age verwendet und der Wert zuvor umgerechnet.
// Im Setter wird eine neue Variable "days" deklariert, die den getzten Wert zunächst aufnimmt.

// Innerhalb einer Klasse mit vielen Eigenschaften fällt es schwer auf den ersten Blick Variablen, Parameter oder Hilfsvariablen zu unterscheiden. 
// Mit Hilfe der Punktnotation lässt sich hier die Lesbarkeit des Codes leicht erhöhen.
// Alle Eigenschaften einer Klasse können innerhalb der Klasse mit dem Bezeichner "self" aufgerufen werden.
// Bei Parametern und Hilfvariablen ist diese Schreibweise nicht möglich, denn sie gehören nicht zur Klasse.

