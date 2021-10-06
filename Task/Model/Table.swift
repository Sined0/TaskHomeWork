//
//  Table.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import SwiftUI
import CoreData




struct Table: View {
    
    @StateObject var model = Fetch()
    @StateObject var modelOne = HomeModel()
    @Environment(\.managedObjectContext) var contex
    
    var body: some View {
        NavigationView{
        HStack{
            VStack{
                HStack{
                    Text("ID User")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Name User")
                        .fontWeight(.bold)
                    Spacer()
                    Text("Avatar User")
                        .fontWeight(.bold)
                }.padding(.horizontal, 15)
                .padding(.top, 10)
                Spacer()
                Divider()
                ScrollView{
                ForEach(model.jsonData){parsId in
                    HStack{
                        
                            Text("\(parsId.id)")
                                Spacer()
                            Text("\(parsId.login)")
                                Spacer()
                                Image(uiImage: "\(parsId.avatar_url)".loadUrlImage())
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .contextMenu(menuItems: {
                                        Button(action: {
                                                modelOne.note = parsId.login
                                                modelOne.writeFolder(context: contex)}, label: {
                                            Text("Добавить в папку")
                                        })
                                    })
                                    
                    }
                    .padding(.horizontal, 15)
                    
                    Divider()
                }
            }
               
            }
         
            
        }.navigationBarTitle("Парсинг JSON")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct Table_Previews: PreviewProvider {
    static var previews: some View {
        Table()
    }
}


extension String {
    
    func loadUrlImage() -> UIImage {
        
        do{
            guard let url = URL(string: self) else { return UIImage() }
        
            let dataImage: Data = try Data(contentsOf: url)
            return UIImage(data: dataImage) ?? UIImage()
            
        }
        catch{
            print(error.localizedDescription)
        }
        
        
        return UIImage()
    }
    
}

