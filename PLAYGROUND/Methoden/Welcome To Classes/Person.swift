//
//  Person.swift


import Foundation

public class Person
{
    public var firstName:String
    public var age:Int
    public var lastName:String
    
    // Durch die Angabe von convenience wird die init-Methode zu einem Convenience-Intializer,
    // mit dem die Initialisierung "bequem" wird.
    // Mit der Methode neue Objekte anzulegen, ist bequem, denn wir müssen beim Aufruf keine Parameter angeben.
    // Die andere init-Methode wird als Designated-Initializer bezeichnet.
    // Sie übernimmt die Initialisierungen der Eigenschaften und auch alle anderen Aufgaben,
    // die für eine neu angelegte Instanz erledigt werden müssen.
    // Eine Klasse sollte nur einen Designated-Initializer haben.
    // Man kann jedoch beliebig viele Convenience-Initializer programmieren.
    // Wichtig ist, dass ein Convenience-Initializer immer einen Designated-Initializer aufruft
    // und Eigenschaften nicht ohne diese Methode initialisiert.
    // Der Designated-Initializer übernimmt dann auch den Aufruf zur Initialisierung der Elternklasse.
    // Der Aufruf der Elternklasse muss immer der letzte Aufruf in der eigenen Initialisierung sein.
    convenience init()
    
    {
        self.init(firstName:"Max", lastName:"Müller",age:32)
    }
    
    // Eine Methode, die sämtliche Parameter als Zeichenketten entgegennimmt
    convenience init?(firstName:String,
        lastName:String, age:String)
    {
        if let convertedValue = Int(age)
        {
            // Umwandlung erfolgreich, Designated-Initializer aufrufen
            self.init(firstName:firstName,
                lastName:lastName ,age:convertedValue)
        }
        else
        {
            // Alle Eigenschaften müssen initialisiert werden, auch wenn die Methode nil zurück gibt
            self.init(firstName:"", lastName:"",age:0)
            return nil
        }
    }

    
    init(firstName:String, lastName:String, age:Int)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    // Das Alter der Person in Tagen (Vereinfachte Berechnung)
    public var ageInDays:Int
    {
        // Getter um den Wert zu lesen
        get { return self.age * 365}
        // Setter um den Wert zu schreiben
        set (days)
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
    
    func getAllPropertiesAsString() -> String
    {
        // Hier wird die private Methode aufgerufen
        return self.getNameProperties()
            + " Ich bin \(self.age) Jahre alt."
    }
    
    // Eine private Methode
    private func getNameProperties() -> String
    {
        return "Mein Name ist \(self.firstName) " +
        "\(self.lastName)."
    }
    
    deinit
    {
        print("Instanz soll aus dem Speicher entfernt werden.")
    }
    
    // Eine einfache Factory-Methode für die Klasse Person
    // Weil diese Methoden Objekte erzeugen, werden sie gelegentlich als 
    // Fabrikmethoden oder Factory-Methoden bezeichnet.
    // Mit "getDefaultInstance" wird ein Objekt der Klasse Person angelegt.
    class func getDefaultInstance() -> Person
     {
            let pers = Person()
            pers.firstName = "Max"
            pers.lastName = "Müller"
            pers.age = 32
            return pers
    }

    // Eine Factory-Methode kann Parameter entgegennehmen und ist daher ausgesprochen gut geeignet,
    // um Objekte zu erstellen, bei denen Werte von einem anderen Objekt übernommen werden.
    // So lässt sich leicht eine Kopie eines Objektes anlegen, bei der sämtliche Eigenschaften 
    // die gleichen Werte besitzen wie das ursprüngliche Objekt.
    class func copyFrom(_ original:Person) -> Person
    {
        let persCopy = Person()
        persCopy.firstName = original.firstName
        persCopy.lastName = original.lastName
        persCopy.age = original.age
        return persCopy
    }
}

