//
//  ListRouter.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class ListRouter: PresenterToRouterProtocol {
    static func createModule() -> ViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let presenter: viewToPresenterProtocol & InteractorToPresenterProtocol = ListPresenter()
        let interactor: PresenterToInteractorProtocol = ListInteractor()
        let router:PresenterToRouterProtocol = ListRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main", bundle: Bundle.main)
    }
    
    func pushToDetailScreen(navigationConroller navigationController:UINavigationController, item: DataModel) {
        let detailModule = DetailRouter.createModule(withItem: item)
        navigationController.pushViewController(detailModule,animated: true)
    }
}
