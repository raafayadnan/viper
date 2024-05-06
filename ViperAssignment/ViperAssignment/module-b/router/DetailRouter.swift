//
//  DetailRouter.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    static func createModule(withItem item: DataModel) -> DetailViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        let presenter: viewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        let interactor: PresenterToInteractorDetailProtocol = DetailInteractor()
        let router:PresenterToRouterDetailProtocol = DetailRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        presenter.fetchUniversity(item)
        
        return view
    }

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }
    
    func backToListScreen(navigationConroller navigationController:UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
