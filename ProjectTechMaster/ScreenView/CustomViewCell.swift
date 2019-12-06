//
//  CustomViewCell.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {

    
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtAddress: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    @IBOutlet weak var txtDate: UILabel!
//    func setIssue(issue:Issue){
//                txtTitle?.text = issue.title
//                txtAddress?.text = issue.address
//                txtTime?.text = issue.time
//                txtDate?.text = issue.date
//            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
