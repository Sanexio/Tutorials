//
//  Employee.swift
//  Company
//
//  Created by Holger Hinzberg
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.

import Foundation

// Die Klasse Employee mit der Elternklasse Peron
public class Employee : Person
{
    public var salary:Double
    public var department:String
    
    convenience init()
    {
        self.init(firstName:"Astrid", lastName:"Müller",age:18)
    }
    
    // Der Designated-Initialier der Elterklasse 
    // wird überschrieben
    override init(firstName:String, lastName:String, age:Int)
    {
        self.salary = 25000
        self.department = "Marketing"
        super.init(firstName:firstName, lastName:lastName, age:age)
    }
    
    // Eine Methode der Elternklasse wird in der
    // abgeleiteten Klasse überschrieben
    override func getAllPropertiesAsString() ->String
    {
        let allProps:String
        // Aufruf der Elternklasse mit super
        = super.getAllPropertiesAsString()
        + "\nIch arbeite in Abteilung \(self.department)."
        + "\nIch verdiene \(self.salary)."
        return allProps
     }
}