//
//  ListInteractor.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import Alamofire

class ListInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchList() {
        guard let url = URL(string: API_FETCH_LIST) else { return }
        Alamofire.request(url, method: .get, headers: ["Content-Type": "application/json"]).responseJSON { response in
            if response.response?.statusCode == 200 {
                if let jsonObject = response.result.value as? [[String: Any]], jsonObject.count != 0 {
                    var universitiesArray: [DataModel] = []
                    for item in jsonObject {
                        universitiesArray.append(DataModel(dictionary: item))
                    }
                    DBManager.shared.write(universities: universitiesArray)
                    self.presenter?.listFetchedSuccess(dataModelArray: universitiesArray)
                } else {
                    let universitiesArray: [DataModel] = DBManager.shared.read()
                    if universitiesArray.count == 0 {
                        self.presenter?.listFetchFailed()
                        return
                    }
                    self.presenter?.listFetchedSuccess(dataModelArray: universitiesArray)
                }
            } else {
                let universitiesArray: [DataModel] = DBManager.shared.read()
                if universitiesArray.count == 0 {
                    self.presenter?.listFetchFailed()
                    return
                }
                self.presenter?.listFetchedSuccess(dataModelArray: universitiesArray)
            }
        }
    }
    
    
}
