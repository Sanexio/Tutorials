//
//  main.swift
//  Errors
//
//  Created by Holger Hinzberg on 10.09.15.
//  Copyright © 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

enum CalculationError : ErrorProtocol
{
    case divideByZero
    case somethingWrong
    case otherError
}

func divide(_ divident:Int, divisor:Int) throws -> Int
{
    guard divisor > 0 else
    {
        throw CalculationError.divideByZero
    }
    return divident / divisor
}

do
{
    var result = try divide(100, divisor: 5)
    result = try divide(result, divisor: 4)
    result = try divide(result, divisor: 0)
}
catch(CalculationError.divideByZero)
{
    print("Es wurde versucht durch Null zu teilen")
}
catch(CalculationError.somethingWrong)
{
    print("Etwas stimmt nicht")
}
catch
{
    print("Unbekannter Fehler")
}

