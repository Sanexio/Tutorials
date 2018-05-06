//: Playground - noun: a place where people can play

import Cocoa

public class DataClass
{
    public var value:String = ""
}

// Starke Verbindung durch eine Zuweisung
var objectInstance = DataClass()

// Die Funktion hält das Objekt "stark" fest
public func setData(data:DataClass)
{
    data.value = "Hallo Swift"
}

setData(objectInstance)

print(objectInstance.value)

// Schwache Verbindung durch eine Zuweisung
weak var objectInstance2 = DataClass()



