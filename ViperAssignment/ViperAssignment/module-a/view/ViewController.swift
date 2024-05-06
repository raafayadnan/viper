//
//  ViewController.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presentor: viewToPresenterProtocol?
    
    var universityArrayList: Array<DataModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presentor?.startFetchingList()
    }
}
extension ViewController: PresenterToViewProtocol {
    func showList(universitiesArray: Array<DataModel>) {
        self.universityArrayList = universitiesArray
        self.tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "", message: "Problem Fetching University List", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityArrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dataList", for: indexPath) as? ListTableCell {
            
            let universityObject = universityArrayList[indexPath.item]
            cell.updateView(universityObject)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let universityObject = universityArrayList[indexPath.item]
        presentor?.showDetailController(navigationController: navigationController!, item: universityObject)
    }
}

