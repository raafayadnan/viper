//
//  DetailViewController.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var universityName: UILabel!
    @IBOutlet weak var universityState: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var webPage: UILabel!
    @IBOutlet weak var countryCode: UILabel!
    
    var presentor: viewToPresenterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    private func updateView(_ data: DataModel) {
        DispatchQueue.main.async {
            self.universityName.text = data.name
            self.universityState.text = data.state
            self.country.text = data.country
            self.webPage.text = data.webPages.first
            self.countryCode.text = data.code
        }
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        presentor?.backToListScreen(navigationController: navigationController!)
    }
    
}
extension DetailViewController: PresenterToViewDetailProtocol {
    func showUniversity(university: DataModel) {
        updateView(university)
    }
    
    func showError() {
        let alert = UIAlertController(title: "", message: "Problem Showing University Detail", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    
}
