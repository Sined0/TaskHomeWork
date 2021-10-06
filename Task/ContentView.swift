//
//  ContentView.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var modelOne = HomeModel()
    @StateObject var model = Fetch()
    @Environment(\.managedObjectContext) var contex
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(key: "note", ascending: false)], animation: .spring()) var loadNote: FetchedResults<Notes>
    var body: some View {
        TabView{
            Table(model: model, modelOne: modelOne).tabItem { Text("Таблица").font(.title).fontWeight(.bold) }.tag(0)
            Folder(modelOne: modelOne, loadNote: _loadNote, contex: _contex).tabItem { Text("Папки").font(.title).fontWeight(.bold) }.tag(1)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
