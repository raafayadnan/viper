//
//  CustomCells.swift
//  ViperAssignment
//
//  Created by Raafay Adnan on 03/05/2024.
//

import Foundation
import UIKit

class ListTableCell: UITableViewCell {
    @IBOutlet weak var universityName: UILabel!
    @IBOutlet weak var universityState: UILabel!
    
    func updateView(_ object: DataModel) {
        self.universityName.text = object.name
        self.universityState.text = object.state
    }
}
