//
//  Rezept.swift
//  MeineRezepte
//
//  Created by Jan Brinkmann on 01/09/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//

class Rezept {
    var name: String
    var zutaten: [[String: String]]
    
    init(rezeptName: String, dieZutaten: [[String: String]]) {
        name = rezeptName
        zutaten = dieZutaten
    }
}

/*
In ViewController.swift werden die Rezepte mit Namen versehen:
 
 override func viewDidLoad() {
 
 super.viewDidLoad()
 
 let muesli = Rezept(   rezeptName: "Müsli",
                        dieZutaten: [
                                    ["name": "Haferflocken", "menge": "100gr"],
                                    ["name": "Nüsse", "menge": "30gr"]
                                    ])
 tableData.append(muesli)
 
 let nudeln = Rezept(   rezeptName: "Spaghetti",
                        dieZutaten: [
                                    ["name": "Spaghetti", "menge": "70gr"],
                                    ["name": "Tomaten", "menge": "3"]
                                    ])
 tableData.append(nudeln)
 
 let pizza = Rezept(    rezeptName: "Pizza",
                        dieZutaten: [
                                    ["name": "Tomaten", "menge": "3"],
                                    ["name": "Käse", "menge": "50gr"]
                                    ])
 tableData.append(pizza)
 
 tableView.reloadData()
 }
*/
