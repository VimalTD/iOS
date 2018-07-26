//
//  WorkHistoryCell.swift
//  Atlantica
//
//  Created by vimal devarajan on 16/07/18.
//  Copyright © 2018 vimal devarajan. All rights reserved.
//

import UIKit

class WorkHistoryCell: UITableViewCell {

    @IBOutlet weak var workHistoryTitle: UILabel!
    @IBOutlet weak var workHistoryDesc: UILabel!
    @IBOutlet weak var workHistoryDate: UILabel!
    @IBOutlet weak var resendMail: WorkHistoryCell!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
