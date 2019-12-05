//
//  MyCustomCell.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/1/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {

    @IBOutlet weak var imgChucNang: UIImageView!
    @IBOutlet weak var txtChucNang: UILabel!
    
    var list:List? {
           didSet{
               if let list = list{
                txtChucNang.text = list.title
                imgChucNang.image = list.img
               }
           }
       }
}
