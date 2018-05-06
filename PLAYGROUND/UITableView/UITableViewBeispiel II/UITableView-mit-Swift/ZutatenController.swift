//
//  ZutatenController.swift
//  UITableView-mit-Swift
//
//  Created by Jan Brinkmann on 15/11/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//
//
// TODO: "Einträge löschen" führt während der Laufzeit zu einem Fehler!
//       -> Fehler trat nur pasager bei Verwendung des iPhone Simulators 6s auf.
//
// TODO: Bei Verwendung des Property-Observer wird die SaveController-View nicht geöffnet

import UIKit

class ZutatenController: UITableViewController, UISearchBarDelegate {

    var isSearching = false
    
    var rezept: Rezept?
    var zutaten = [String]()
    
    // Property-Observer:
    /* {
        didSet {
            self.tableView.reloadData()
        }
    } */
    
    var filterZutaten = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Über Optional-Binding wird geprüft, ob die Variable existiert.
        // Das Ganze ist eine Hilfskonstruktion: In einer realen App wären die Daten in Core-Data abgelegt oder über eine API abzurufen.
        // Die Daten würden dann an dieser Stelle über eine ID aus dem Core-Data Bestand ausgelesen.
        if let finalRezept = rezept {
            self.title = finalRezept.title
            self.zutaten = finalRezept.zutaten
        }
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filterZutaten.count
        }
        
        return zutaten.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("zutatCell", forIndexPath: indexPath)

        if isSearching {
            cell.textLabel?.text = filterZutaten[indexPath.row]
        } else {
            cell.textLabel?.text = zutaten[indexPath.row]
        }
        
        return cell
    }

    //
    //
    // Tabellenzeilen neu ordnen
    
    @IBOutlet weak var editToggle: UIBarButtonItem!
    
    @IBAction func editTapped(sender: AnyObject) {
        self.editing = !editing
        
        if self.editing {
            editToggle.title = "Done"
        } else {
            editToggle.title = "Edit"
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        // ...
        // Reihenfolge im Attribut xyz speichern/verändern
        // ...
    }
    
    //
    //
    // einträge löschen
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            zutaten.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath],
                withRowAnimation: .Automatic
            )
        }
    }
    
    //
    //
    // zutaten hinzufügen
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "neueZutat" {
            let ctrl = segue.destinationViewController as! SaveController
            ctrl.saveDelegate = {
                (newEntry: String) in
                
                self.zutaten.append(newEntry)
                self.navigationController?.popViewControllerAnimated(true)
                
                self.tableView.reloadData()
                
            }
        }
    }
    
    //
    //
    // searchbar delegate
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        isSearching = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        isSearching = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        isSearching = false;
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        isSearching = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterZutaten = zutaten.filter({
            (zutat: String) -> Bool in
            
            return zutat.containsString(searchText)
        })
        
        if filterZutaten.count == 0 {
            isSearching = false
        } else {
            isSearching = true
        }
        
        self.tableView.reloadData()
    }
}
