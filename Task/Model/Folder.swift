//
//  Folder.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import SwiftUI
import CoreData


struct Folder: View {
    @StateObject var modelOne = HomeModel()
    @FetchRequest(entity: Notes.entity(), sortDescriptors: [NSSortDescriptor(key: "note", ascending: false)], animation: .spring()) var loadNote: FetchedResults<Notes>
    @Environment(\.managedObjectContext) var contex
    var body: some View {
        
        
        ZStack{
            
            ZStack{
                NavigationView{
                    
                    VStack{
                        
                        VStack{
                        
                            HStack{
                                Text("Добавленные пользователи")
                                    .foregroundColor(.black)
                                
                                Spacer(minLength: 0)
                                
                                Button(action: {modelOne.isRotated.toggle()}, label: {
                                    Image(systemName:  modelOne.isRotated == false ? "chevron.right" : "chevron.down")
                                        .foregroundColor(.orange)
                                })
                                
                            }.padding(.horizontal, 20)
                            .padding(.top, 10)
                            
                            if modelOne.isRotated == true{
                                ForEach(loadNote){nameUser in
                                    Text(nameUser.note ?? "")  .contextMenu{
                                        Button(action: {contex.delete(nameUser)
                                            try! contex.save()
                                        }, label: {
                                            Text("Удалить")
                                        })
                                    }
                                    
                                    
                                }
                            }
                            
                        }
                        
                        Spacer(minLength: 0)
                        
                    }
                    
                    .navigationBarTitle("Папки")
                   
                    .navigationBarTitleDisplayMode(.inline)
                    
                   
                }
                
            }
            
        }
        
        
    }
}

struct Folder_Previews: PreviewProvider {
    static var previews: some View {
        Folder()
    }
}

