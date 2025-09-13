//
//  NetworkManager1.swift
//  Exam1
//
//  Created by Tejasv Singh on 9/12/25.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
        
        private init() {}
        //    func fetchPerson(from urlString: String)
        
       func getData(from urlString: String, closure: @escaping (Data?) -> Void) {
            guard let url = URL(string: urlString) else {
               closure(nil)
               return
           }
           
           URLSession.shared.dataTask(with: url) { data, _, error in
               if let error = error {
                   print("Error fetching data: \(error)")
                   closure(nil)
                   return
               }
               closure(data)
           }.resume()
        }
        
    func parse(data: Data?) -> DetailModel? {
        guard let data = data else { return nil }
        do {
            let dec = JSONDecoder()
            if let list = try? dec.decode([DetailModel].self, from: data),
               let first = list.first {
                return first
            }
            return try dec.decode(DetailModel.self, from: data)
        } catch {
            print("Error parsing data:", error)
            return nil
        }
    }
    }
