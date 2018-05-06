//
//  Item + ObjectInformationProtocol.swift
//  Protokoll
//
//  Created by Holger Hinzberg on 23.08.15.
//  Copyright © 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

extension Item : ObjectInformationProtocol
{
    @objc public func getLocation() -> String
    {
        return "Ich bin im Lager."
    }
    
    @objc func getInformation() -> String
    {
        return ""
    }
}