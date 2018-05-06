//
//  main.swift
//  Protokoll

import Foundation

// Protokoll statt eines Datentyps
let info:ObjectInformationProtocol = Employee()
// Oder
//let info:ObjectInformationProtocol = Person()
// Oder
// let info:ObjectInformationProtocol = Item()

// Die Methode aus dem Protokoll kann aufgerufen werden:
var location = info.getLocation()
print(location)

// Andere Methoden können nicht aufgerufen werden:
// info.getAllPropertiesAsString()

// Definition einer Funktion mit einem Protokoll statt eines Datentypen:
func outputLocation(objectInfo:ObjectInformationProtocol)
{
    // Aufruf der Methode die im Protokoll deklariert wurde
    let location = objectInfo.getLocation()
    print(location)
    
    // Methode der Klasse kann hier nicht aufgerufen werden
    // let properties = employee.getAllPropertiesAsString()
    // print(properties)
    
    // Aufruf einer Methode, die optional im Protokoll deklariert wurde
    let info
    = objectInfo.getInformation?() ?? "Keine Informationen"
    print(info)
}

var employee = Employee()
employee.firstName = "Max"
employee.lastName = "Müller"
employee.address = AddressData()
employee.address?.zipCode = "44227"
employee.address?.city = "Dortmund"

// Methode kann hier aufgerufen werden
var properties = employee.getAllPropertiesAsString()
print(properties)

// Aufruf der Funktion
outputLocation(employee)

let ide = "Entwicklungsumgebung"
print(ide)
// Elf Zeichen von rechts
print(ide.left(11))
// Acht Zeichen von links
print(ide.right(8))

// Definition eines Item-Objektes
let extendedItem = Item()
// Aufruf der Funktion
outputLocation(extendedItem)



