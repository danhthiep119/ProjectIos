//
//  Register.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/1/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class Register: UIViewController {

    @IBOutlet weak var txtTen: UITextField!
    @IBOutlet weak var txtSDT: UITextField!
    
    
    @IBOutlet weak var txtMatKhau: UITextField!
    
    @IBOutlet weak var txtNhapLai: UITextField!
    
    @IBOutlet weak var btnDangKy: UIButton!
    
    @IBOutlet weak var btnDangNhap: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editView()
        
        addLeftImage(textField: txtTen, img: UIImage(named: "iconUser") ?? UIImage())
        addLeftImage(textField: txtSDT, img: UIImage(named: "iconPhone") ?? UIImage())
        addLeftImage(textField: txtMatKhau, img: UIImage(named: "iconKey") ?? UIImage())
        addLeftImage(textField: txtNhapLai, img: UIImage(named: "iconKey") ?? UIImage())
    }
    
    func editView(){
        txtTen.underlined(.gray)
        txtSDT.underlined(.gray)
        txtMatKhau.underlined(.gray)
        txtNhapLai.underlined(.gray)
        txtMatKhau.isSecureTextEntry = true
        txtNhapLai.isSecureTextEntry = true
        
        
        
        btnDangKy.titleLabel?.font =  .boldSystemFont(ofSize: 20)
        btnDangNhap.titleLabel?.font =  .boldSystemFont(ofSize: 20)
        btnDangKy.layer.cornerRadius = 8
    }
    
    
    func addLeftImage(textField:UITextField,img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
    }

    @IBAction func btnDangKy(_ sender: Any) {
    }
    
    @IBAction func btnDangNhap(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}


