//
//  ViewModelTable.swift
//  Task
//
//  Created by Denis on 06.10.2021.
//

import Foundation
import SwiftUI
import CoreData

class Fetch: ObservableObject {
    @Published var jsonData = [ParJS]()
    @Published var isOn = false
    @Published var idSelf = 0
    
    init() {
           let url = URL(string: "https://api.github.com/users/hadley/orgs")!
           URLSession.shared.dataTask(with: url) {(data, response, error) in
               do {
                   if let todoData = data {
                       let decodedData = try JSONDecoder().decode([ParJS].self, from: todoData)
                       DispatchQueue.main.async {
                           self.jsonData = decodedData
                       }
                   } else {
                       print("No data")
                   }
               } catch {
                   print("Error")
               }
           }.resume()
       }
    
}

    struct ParJS: Identifiable, Codable{
        
        var id: Int
        var login: String
        var avatar_url: String
    }
