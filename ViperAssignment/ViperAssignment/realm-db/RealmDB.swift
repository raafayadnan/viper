//
//  RealmDB.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 04/05/2024.
//

import Foundation
import RealmSwift

class DBManager {
    
    static let shared = DBManager()
    
    let realm = try! Realm()
    
    private func getDatabaseURL() -> URL? {
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func write(universities: [DataModel]) {
        do {
            realm.beginWrite()
            realm.add(universities, update: .modified)
            try realm.commitWrite()
        } catch {
            print("Failed")
        }
    }
    
    func read() -> [DataModel] {
        do {
            realm.beginWrite()
            let data = realm.objects(DataModel.self)
            let items = Array(data)
            try realm.commitWrite()
            
            return items
        } catch {
            print("Failed")
        }
        return []
    }
}
