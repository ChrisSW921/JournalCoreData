//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Chris Withers on 1/18/21.
//

import CoreData


extension Entry {
@discardableResult convenience init(title: String, text: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
    self.init(context: context)
    self.title = title
    self.text = text
    self.timeStamp = timeStamp
    }
}

