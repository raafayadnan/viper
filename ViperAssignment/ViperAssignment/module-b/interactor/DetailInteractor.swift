//
//  DetailInteractor.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation

class DetailInteractor: PresenterToInteractorDetailProtocol {
    
    var presenter: InteractorToPresenterDetailProtocol?
    
    func fetchSingleUniversity(_ item: DataModel) {
        presenter?.universityFetchedSuccess(dataModel: item)
    }
    
}
