//
//  main.swift
//  Company
//
//  Created by Holger Hinzberg on 13.12.14.
//  Copyright (c) 2014 Holger Hinzberg. All rights reserved.
//

import Foundation

let karl = Employee()
karl.age = 43
karl.firstName = "Karl"
karl.lastName = "Lehmann"
karl.salary = 12500
karl.department = "Verkauf"

print(karl.getAllPropertiesAsString())
print("Gehalt: \(karl.salary)")
print("Abteilung: \(karl.department)")


// Objekt-Instanz erzeugen und die
// Standartwerte ausgeben
var astrid = Employee()
print(astrid.getAllPropertiesAsString())


// Initialisierung der Klasse Person mit dem designierten Initializer
let jan = Person(firstName: "Jan", lastName: "Römer", age: 65)

// Die Klasse Employee erbt diese Methode nicht
// let kai = Employee(firstName: "Kai", lastName: "Keller", age: 56)

// Employee-Instanz erzeugen
let mike
= Employee(firstName: "Mike", lastName: "Maurer", age: 51)

// AddressData-Objekt dem Employee-Objekt zuweisen
mike.address = AddressData()

// Eigenschaften der Adresse nachträglich setzen
mike.address!.street = "Beethovenring"
mike.address!.zipCode = "59423"
mike.address!.city = "Unna"


// Eine Employee-Instanz erzeugen
// Der Employee ist ein Optional
var susi:Employee?
// = Employee(firstName: "Susanne", lastName: "Landmann", age: 28)

// AddressData-Objekt dem Employee-Objekt zuweisen
// Der Optional muss imer ausgepackt werden
susi?.address = AddressData()

// Eigenschaften der Adresse nachträglich setzten
susi?.address?.street = "Mozartstraße"
susi?.address?.zipCode = "59423"
susi?.address?.city = "Unna"

// Gibt es ein Employee-Objekt?
if susi != nil
{
    // Gibt es ein AddressData-Objekt?
    if susi!.address != nil
    {
        print("Der Wohnort ist: \(susi!.address!.city)")
    }
}

// Überprüfung mit Optional Chaining
if let theCity = susi?.address?.city
{
    print("Der Wohnort ist: \(theCity)")
}


// Methode aufrufen, wenn es eine
// gültige Instanz gibt
susi?.getAllPropertiesAsString()

// Zuweisung mit einem Coalescing-Operator
let myCity = susi?.address?.city ?? "Kein Wohnort hinterlegt"
print(myCity)


