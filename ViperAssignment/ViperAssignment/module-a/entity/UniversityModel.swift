//
//  UniversityModel.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import RealmSwift

class DataModel: Object {
    
    @objc dynamic var primaryKey: String = ""
    
    @objc dynamic var code: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    let domains = List<String>()
    let webPages = List<String>()
    @objc dynamic var state: String = ""
    
    override static func primaryKey() -> String? { // Override primaryKey() function
        return "name"
    }
    
    convenience init(dictionary dict: [String:Any]) {
        self.init()
        self.code = String(describing: dict["alpha_two_code"] ?? "")
        self.name = String(describing: dict["name"] ?? "")
        self.country = String(describing: dict["country"] ?? "")
        if let domainsArray = dict["domains"] as? [String] {
            self.domains.append(objectsIn: domainsArray)
        }
        if let webPagesArray = dict["web_pages"] as? [String] {
            self.webPages.append(objectsIn: webPagesArray)
        }
        self.state = String(describing: dict["state-province"] ?? "")
    }
}

/*
 {
         "alpha_two_code": "PK",
         "name": "Information Technology University, Lahore",
         "country": "Pakistan",
         "domains": [
             "itu.edu.pk"
         ],
         "web_pages": [
             "https://itu.edu.pk/"
         ],
         "state-province": "Punjab"
     }
 */
