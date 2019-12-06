//
//  UpdateInfomation.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/1/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class UpdateInfomation: UIViewController {

    @IBOutlet weak var imgAvata: UIImageView!
    @IBOutlet weak var btnDoiHinhANh: UIButton!
    
    @IBOutlet weak var txtTen: UITextField!
    
    @IBOutlet weak var txtSDT: UITextField!
    
    @IBOutlet weak var txtDiaChi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        editView()
        navigationItem.title = "Hồ Sơ"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown
    }
    @objc func showMenu(){
            dismiss(animated: true, completion: nil)
        }
    func editView(){
        txtTen.underlined(.gray)
        txtSDT.underlined(.gray)
        txtDiaChi.underlined(.gray)
        
        imgAvata.layer.cornerRadius = self.imgAvata.frame.width/2
    }
    


}
