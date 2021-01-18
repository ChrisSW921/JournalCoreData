//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Chris Withers on 1/18/21.
//

import Foundation
import CoreData

class EntryController {
    
    static var shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
         let request = NSFetchRequest<Entry>(entityName: "Entry")
         request.predicate = NSPredicate(value: true)
         return request
     }()
    
    func addEntry(withTitle: String, text: String, timeStamp: Date = Date()){
        print("added")
        Entry(title: withTitle, text: text, timeStamp: timeStamp)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries(){
        entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func editEntry(entry: Entry, title: String, text: String){
        entry.title = title
        entry.text = text
        CoreDataStack.saveContext()
    }
    
    func removeEntry(entry: Entry){
        guard let entryIndex = entries.firstIndex(of: entry) else { return }
        entries.remove(at: entryIndex)
        CoreDataStack.saveContext()
    }
    
    
}
