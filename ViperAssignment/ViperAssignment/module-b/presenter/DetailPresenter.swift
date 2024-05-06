//
//  DetailPresenter.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class DetailPresenter: viewToPresenterDetailProtocol {
    var view: PresenterToViewDetailProtocol?
    
    var interactor: PresenterToInteractorDetailProtocol?
    
    var router: PresenterToRouterDetailProtocol?
    
    func fetchUniversity(_ item: DataModel) {
        interactor?.fetchSingleUniversity(item)
    }
    
    func backToListScreen(navigationController: UINavigationController) {
        router?.backToListScreen(navigationConroller: navigationController)
    }
}
extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func universityFetchedSuccess(dataModel: DataModel) {
        view?.showUniversity(university: dataModel)
    }
    
    func universityFetchFailed() {
        view?.showError()
    }
}
