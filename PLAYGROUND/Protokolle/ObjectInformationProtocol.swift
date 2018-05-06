//
//  ObjectInformationProtocol.swift
//  Protokoll
//
//  Created by Holger Hinzberg on 23.08.15.
//  Copyright © 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

@objc protocol ObjectInformationProtocol
{
    func getLocation() -> String
    // Eine optionale Vorgabe
    optional func getInformation() -> String
}
