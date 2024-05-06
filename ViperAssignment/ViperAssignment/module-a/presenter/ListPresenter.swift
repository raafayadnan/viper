//
//  ListPresenter.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class ListPresenter: viewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingList() {
        interactor?.fetchList()
    }
    
    func showDetailController(navigationController: UINavigationController, item: DataModel) {
        router?.pushToDetailScreen(navigationConroller: navigationController, item: item)
    }
}
extension ListPresenter: InteractorToPresenterProtocol {
    func listFetchedSuccess(dataModelArray: Array<DataModel>) {
        view?.showList(universitiesArray: dataModelArray)
    }
    
    func listFetchFailed() {
        view?.showError()
    }
}
