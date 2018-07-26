//
//  EquipmentCellTableViewCell.swift
//  Atlantica
//
//  Created by vimal devarajan on 19/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class EquipmentCellTableViewCell: UITableViewCell {


    
    @IBOutlet weak var modelEquipCell: UITextField!
    @IBOutlet weak var serialEquiipCell: UITextField!
    @IBOutlet weak var descEquipCell: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
