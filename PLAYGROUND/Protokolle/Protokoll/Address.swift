//
//  Address.swift
//  Company
//
//  Created by Holger Hinzberg on 18.12.14.
//  Copyright (c) 2014 Holger Hinzberg. All rights reserved.
//

import Foundation

public class AddressData
{
    public var street:String
    public var zipCode:String
    public var city:String
    
    convenience init()
    {
        self.init(street:"", zipCode:"", city:"")
    }
    
    init(street:String, zipCode:String, city:String)
    {
        self.street = street
        self.zipCode = zipCode
        self.city = city
    }
}

