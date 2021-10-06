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
////                                ScrollView{
////
////                                    LazyVStack{
////                                        VStack(alignment: .leading){
////
////
//
////
////
////
////
////                                                Spacer(minLength: 0)
////
////                                                Divider()
////
////                                            }
////
////
////
////                                        }
////                                        .frame(maxWidth: .infinity)
////                                        .padding(.vertical, 5)
////                                        .background(Color.black.opacity(0.30))
////                                        .cornerRadius(10)
////                                    }.padding(.horizontal, 15)
////
////                                }
//                            }
                            
                        }
                        
                        Spacer(minLength: 0)
//                        VStack{
//                            HStack{
//
//                                Image(systemName: "folder.badge.plus")
//                                    .resizable()
//                                    .frame(width: 30, height: 25)
//                                    .foregroundColor(.orange)
//                                    .contextMenu{
//                                        Button(action: {self.modelOne.selectIcloud()}, label: {
//                                            Text(">iCloud")
//                                        })
//                                        Button(action: {self.modelOne.selectIphone()}, label: {
//                                            Text(">iPhone")
//                                        })
//                                    }
//
//
//
//
//                                Spacer(minLength: 0)
//                                Image(systemName: "square.and.pencil")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//                                    .foregroundColor(.orange)
//
//                            }.padding(.horizontal, 20)
//                        }
//                        .padding(.horizontal,15)
//                        .padding(.vertical, 10)
                        
                        
                    }
                    
                    .navigationBarTitle("Папки")
                   
                    .navigationBarTitleDisplayMode(.inline)
                    
                   
                }
                
            }
//            ZStack{
//                if modelOne.isAlertShow == true {
//                    AlertView(modelOne: modelOne)
//
//                }
//            }
            
            
            
        }
        
        
    }
}

struct Folder_Previews: PreviewProvider {
    static var previews: some View {
        Folder()
    }
}

