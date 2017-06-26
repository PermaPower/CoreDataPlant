//
//  ViewController.swift
//  CoreDataPlants
//
//  Created by Regina Power on 26/6/17.
//  Copyright © 2017 Permapower. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let CoreDataNotebookClassName:String = String(describing: Notebook.self)
		let CoreDataNotesClassName:String = String(describing: Note.self)
		
		
		let notebook:Notebook = NSEntityDescription.insertNewObject(forEntityName: CoreDataNotebookClassName, into: DatabaseController.getContext()) as! Notebook
		
		notebook.title = "Flowers"
		
		let note:Note = NSEntityDescription.insertNewObject(forEntityName: CoreDataNotesClassName, into: DatabaseController.getContext()) as! Note
		
		note.text = "Note text"
		
		 notebook.addToNotes(note)
		
		// https://revs.runtime-revolution.com/core-data-on-ios-10-a-brief-overview-with-an-example-dc6e0ce844a5
		// https://www.youtube.com/watch?v=da6W7wDh0Dw&t=1123s
		
		// ** Only required if you want to add a new row to the database
		// DatabaseController.saveContext()
		
		// ** Add Remove all predicates if you want to see all of rows
		
		
		// ** Setup predicate for searching the Notebook (filter)
		let fetechRequest:NSFetchRequest<Notebook> = Notebook.fetchRequest()
		let predicate = NSPredicate(format: "title == 'Trees'")
		fetechRequest.predicate = predicate
		
		
		// ** Setup predicate for searching the Note (filter)
//		let fetchRequestNote: NSFetchRequest<Note> = Note.fetchRequest()
//		let predicateNote = NSPredicate(format: "text == 'Note text'")
//		fetchRequestNote.predicate = predicateNote

		
		do{
//			** Now show the results depending on how you have filtered it
			
			let searchResults = try DatabaseController.getContext().fetch(fetechRequest)
			print ("Number of results: \(searchResults.count)")
			
			for result in searchResults as [Notebook] {
				print ("Results = \(result.title!)")
			}
			
//			let searchResults = try DatabaseController.getContext().fetch(fetchRequestNote)
//			print ("Number of results: \(searchResults.count)")
//			
//			for result in searchResults as [Note] {
//				print ("Results = \(result.text!)")
//			}
			
		}
			catch {
				print("Error: \(error)")
			}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

