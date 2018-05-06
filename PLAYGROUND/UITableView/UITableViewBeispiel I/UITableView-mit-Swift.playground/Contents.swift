/*
 
 UITableViewDataSource - Die Tabelle konfigurieren:
 
 •  tableView(_:cellForRowAtIndexPath:)
 Holt das UITableViewCell Objekt für den NSIndexPath mit Nummer der Sektion x und Zeile y.
 
 •  tableView(_:numberOfRowsInSection:)
 Hier wird die Anzahl der Zeilen in der Section x abgefragt.
 Wenn es keine Sektionen gibt, dann wird die Gesamtzeile der Zeilen der Tabelle zurückgegeben.
 
 •  numberOfSectionsInTableView(_:)
 Gibt die Anzahl der Sektionen zurück. Das ist automatisch 1, wenn sie nicht implementiert wird.
 
 •  sectionIndexTitlesForTableView(_:)
 Gibt ein Array mit den Indexnamen zurück. Das sind im Adressbuch bspw. die Buchstaben von A bis Z.
 
 •  tableView(_:sectionForSectionIndexTitle:atIndex:)
 Hier wird einem Index die Position zugeordnet und zurückgegeben.
 Bei der Adressbuch-App würde z.B. einem Buchstaben zwischen A und Z die Sektion zuordnet.
 
 •  tableView(_:titleForHeaderInSection:)
 Hier wird die Kopfzeile für die Sektion x abgefragt und zurückgegeben.
 
 •  tableView(_:titleForFooterInSection:)
 Analog zur Kopfzeile wird hier der Titel für die Fußteile der Sektion x abgefragt und zurückgegeben.
 
 Zwingend benötigt werden nur die ersten beiden Methoden.
 Die Methode muss wissen wie viele Tabellenzeilen in einer Sektion enthalten sind.
 Die Anzahl der Einträge liefert die Methode mit dem Parameter numberOfRowsInSection.
 Außerdem ist es natürlich wichtig, dass die jeweiligen Tabelleninhalte abgefragt werden können.
 Dazu dient der Aufruf mit dem Parameter cellForRowAtIndexPath.
 
 
 Zeilen einfügen und löschen:
 
 •  tableView(_:commitEditingStyle:forRowAtIndexPath:)
 Die Methode wird aufgerufen, wenn eine Tabellenzeile mit dem roten Button entfernt wird.
 Sie dient dazu, den Vorgang in der Datenquelle vorzunehmen.
 Wir werden das später noch am Beispiel sehen.
 Um das Löschen per wischen zu ermöglichen, muss diese Methode implementiert werden.
 
 •  tableView(_:canEditRowAtIndexPath:)
 Über diese Methode können Zeilen einzeln oder ganz vom editieren ausgeschlossen werden.
 
 
 Tabellenzeilen neu ordnen:
 
 •  tableView(_:canMoveRowAtIndexPath:)
 Auch hier wird eine Berechtigung eingeholt.
 Einzelne oder alle Zeilen können von einer neuen Sortierung ausgeschlossen werden.
 
 •  tableView(_:moveRowAtIndexPath:toIndexPath:)
 Werden Zeilen neu geordnet, wird diese Methode aufgerufen.
 Sie ermöglicht es zum Beispiel ein Attribut für die Sortierung zu verändern,
 falls die Reihenfolge persistent gespeichert wird.
 
 */
