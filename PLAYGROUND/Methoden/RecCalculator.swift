//
// RecCalculator.swift
// Im folgenden Listing liefern die Methode "getArea"
// sowie die Eigenschaft "area" der Klasse "RecCalculator" 
// beide die Fläche eines Rechtecks, das Produkt aus Länge und Breite.

import Foundation

public class RecCalculator
{
    public var width:Double = 0
    public var length:Double = 0
    
    
    
    // Die Fläche, als berechnende Eigenschaft der Klasse
    public var area:Double
        {
        get {return self.length * self.width}
    }
    
    
    
    // Die Fläche, von einer Methode berechnet
    public func getArea() -> Double
    {
        return self.length * self.width
    }
}