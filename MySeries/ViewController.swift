//
//  ViewController.swift
//  MySeries
//
//  Created by Nicolas Chaussin on 23/05/2015.
//  Copyright (c) 2015 nc. All rights reserved.
//

import Cocoa
import CoreData

class ViewController: NSViewController {

  // Retrieve the managedObjectContext from AppDelegate
  let managedObjectContext = (NSApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

  @IBOutlet weak var titleLabel: NSTextField!
  @IBOutlet weak var summaryLabel: NSTextField!
  
  @IBAction func clickInsert(sender: NSButton) {
    let newSerie = NSEntityDescription.insertNewObjectForEntityForName("Serie", inManagedObjectContext: self.managedObjectContext!) as! Serie
    
    newSerie.title = "Madmen"
    newSerie.summary = "A serie from the 60s"
  }

  @IBAction func readClick(sender: NSButton) {
    // Create a new fetch request using the LogItem entity
    let fetchRequest = NSFetchRequest(entityName: "Serie")
    
    // Execute the fetch request, and show the 1st object
    if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Serie] {
      
      if fetchResults.count>0 {
        titleLabel.stringValue = fetchResults[0].title
        summaryLabel.stringValue = fetchResults[0].summary
      }
      else {
        titleLabel.stringValue = "ERROR"
        summaryLabel.stringValue = "no record, press insert to add"
      }
    }

  }
  

}

