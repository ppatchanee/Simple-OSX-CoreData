//
//  Serie.swift
//  
//
//  Created by Nicolas Chaussin on 23/05/2015.
//
//

import Foundation
import CoreData

@objc(Serie)
class Serie: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var summary: String

}
