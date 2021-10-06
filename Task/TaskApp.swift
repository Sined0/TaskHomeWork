//
//  TaskApp.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import SwiftUI
import CoreData

@main
struct CoreData_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


var persistenceContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: "Task")
    container.loadPersistentStores(completionHandler: {(storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unreolved error \(error), \(error.userInfo)")
        }
    })
    
    return container
    
    
}()


func saveContex() {
    let contex = persistenceContainer.viewContext
    if contex.hasChanges {
        do {
            try contex.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unreolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
