//
//  DetailProtocols.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

protocol viewToPresenterDetailProtocol: AnyObject {
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    func fetchUniversity(_ item: DataModel)
    func backToListScreen(navigationController:UINavigationController)
}

protocol PresenterToViewDetailProtocol: AnyObject {
    func showUniversity(university: DataModel)
    func showError()
}

protocol PresenterToRouterDetailProtocol: AnyObject {
    static func createModule(withItem: DataModel) -> DetailViewController
    func backToListScreen(navigationConroller: UINavigationController)
}

protocol PresenterToInteractorDetailProtocol: AnyObject {
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    func fetchSingleUniversity(_ item: DataModel)
}

protocol InteractorToPresenterDetailProtocol: AnyObject {
    func universityFetchedSuccess(dataModel: DataModel)
    func universityFetchFailed()
}

