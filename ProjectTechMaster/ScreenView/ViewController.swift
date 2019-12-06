//
//  ViewController.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/1/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class ViewController: UIViewController {

    @IBOutlet weak var txtCheck: UILabel!
    @IBOutlet weak var txtSDT: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnDangNhap: UIButton!
    
    var token:String?
//    var user : User?
    
    
    @IBOutlet weak var btnDangKy: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        editView()
//        thêm icon bên trái text Field
        addLeftImage(textField: txtSDT, img: UIImage(named: "iconPhone") ?? UIImage())
        addLeftImage(textField: txtPass, img: UIImage(named: "iconKey") ?? UIImage())
        
//        restAPI()
    }
    
    func restAPI(phone:String,password:String){let params = [
        "phone": phone,
        "password": password
        ]
        let url = "http://45.118.145.149:8100/login"
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<User>) in
            let profileResponse = response.result.value
            print(profileResponse?.code)
            if profileResponse?.code == 0
            {
            if let res = profileResponse?.data  {
                print(res.token)
                self.token = UserDefaults.standard.string(forKey: res.token) ?? ""
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as! ListIssue
                let navigation = UINavigationController(rootViewController: mainVC)
                navigation.modalPresentationStyle = .fullScreen
                self.present(navigation, animated: true, completion: nil)
            }
            }
            else {
                print(profileResponse?.message)
                self.txtCheck.isHidden = false
                self.txtCheck.text = profileResponse?.message
            }
        }
        
    }

    func addLeftImage(textField:UITextField,img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        textField.leftView = leftImageView
        textField.leftViewMode = .always
        
    }
    
    func editView(){
        txtCheck.isHidden = true
        txtPass?.isSecureTextEntry = true
        
        //In đậm chữ
        btnDangNhap?.titleLabel?.font =  .boldSystemFont(ofSize: 20)
        btnDangKy?.titleLabel?.font =  .boldSystemFont(ofSize: 20)
        //tạo gạch dưới text field
        txtSDT?.underlined(.gray)
        txtPass?.underlined(.gray)
        
        //bo góc nút đang nhập
        btnDangNhap.layer.cornerRadius = 8
    }
    
    
    @IBAction func btnDangNhap(_ sender: Any) {
        guard let phone = txtSDT.text else { return}
        guard let pass = txtPass.text else { return}
        restAPI(phone: phone, password: pass)
    }
    @IBAction func btnDangKy(_ sender: Any) {
        
    }
}



extension UITextField {
    
    func underlined(_ color: UIColor){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
