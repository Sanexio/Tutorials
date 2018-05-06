//
//  Person.swift
//  Welcome To Classes
//
//  Created by Holger Hinzberg on 12.08.15.
//  Copyright © 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

public class Person
{
    public var firstName:String
    public var age:Int
    public var lastName:String
    // Deklaration der Eigenschaft address als Optional
    public var address:AddressData?
    
    convenience init()
    {
        self.init(firstName:"Max", lastName:"Müller",age:32)
    }
    
    // Eine Methode, die sämtliche Parameter als
    // Zeichenketten entgegennimmt
    convenience init?(firstName:String,
        lastName:String, age:String)
    {
        if let convertedValue = Int(age)
        {
            // Umwandlung erfolgreich,
            // Designated-Initializer aufrufen
            self.init(firstName:firstName,
                lastName:lastName ,age:convertedValue)
        }
        else
        {
            // Alle Eigenschaften müssen initialisiert werden,
            // auch wenn die Methode nil zurück gibt
            self.init(firstName:"", lastName:"",age:0)
            return nil
        }
    }

    
    init(firstName:String, lastName:String, age:Int)
    {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        // self.address = AddressData()
    }
    
    // Das Alter der Person in Tagen
    // (Vereinfachte Berechnung)
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
    
    // Eine einfache Factory-Methode
    // für die Klasse Person
    class func getDefaultInstance() -> Person
     {
            let pers = Person()
            pers.firstName = "Max"
            pers.lastName = "Müller"
            pers.age = 32
            return pers
    }

    // kopierten Eigenschaften anzulegen
    class func copyFrom(_ original:Person) -> Person
    {
        let persCopy = Person()
        persCopy.firstName = original.firstName
        persCopy.lastName = original.lastName
        persCopy.age = original.age
        return persCopy
    }
}

