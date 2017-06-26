//
//  Note+CoreDataProperties.swift
//  CoreDataPlants
//
//  Created by Regina Power on 26/6/17.
//  Copyright © 2017 Permapower. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var text: String?
    @NSManaged public var notebooks: Notebook?

}
