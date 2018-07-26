//
//  InvoiceCell.swift
//  Atlantica
//
//  Created by vimal devarajan on 20/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class InvoiceCell: UITableViewCell {

    @IBOutlet weak var invoiceCEllTextTitle: UILabel!
    @IBOutlet weak var invoiceCellTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
