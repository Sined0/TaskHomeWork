//
//  ViewModelFolder.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import CoreData
import SwiftUI


class HomeModel: ObservableObject{
    @Published var textSearch = ""
    @Published var isRotated = false
    
    @Published var note = ""
    @Published var NewNotesView: Notes!
    
    
    
    func writeFolder(context: NSManagedObjectContext){
        
        let newFolder = Notes(context: context)
        newFolder.note = note
        do{
            try context.save()
            note = ""
            print("Notes Yes")
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
