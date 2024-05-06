//
//  ListProtocols.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

protocol viewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingList()
    func showDetailController(navigationController:UINavigationController, item: DataModel)
}

protocol PresenterToViewProtocol: AnyObject {
    func showList(universitiesArray: Array<DataModel>)
    func showError()
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule() -> ViewController
    func pushToDetailScreen(navigationConroller: UINavigationController, item: DataModel)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchList()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func listFetchedSuccess(dataModelArray: Array<DataModel>)
    func listFetchFailed()
}
