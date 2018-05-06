//
//  String + More Methods.swift
//  Protokoll
//
//  Created by Holger Hinzberg on 23.08.15.
//  Copyright © 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

extension String
{
    public func left(charCount:Int) -> String
    {
        return String(self.characters.prefix(charCount))
    }
    
    public func right(charCount:Int) -> String
    {
        return String(self.characters.suffix(charCount))
    }
    
    func contains(find: String) -> Bool
    {
        if self.rangeOfString(find) != nil
        {
            return true
        }
        return false
    }
}