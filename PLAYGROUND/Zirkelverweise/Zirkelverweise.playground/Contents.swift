// update 28.07.2016, 09:00

// Zirkelverweise

import Foundation
import Cocoa

public class Driver
{
    var name = "Larry Fast"
    var car: Racer?
}

public class Racer
{
    var name = "Red Winner"
    weak var owner:Driver?
}

var larry = Driver()
var larrysCar = Racer()

// Der Wagen wird dem Fahrer zugewiesen
larry.car = larrysCar
// Dem Wagen wird der Fahrer zugewiesen
larrysCar.owner = larry

// Ausgabe des Fahrzeugnames über den Fahrer
print(larry.car?.name)

// Ausgabe des Fahrernamens über das Fahrzeug
print(larrysCar.owner?.name)
