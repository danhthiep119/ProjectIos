//
//  IssueView.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
class IssueView: UIViewController {

//    var issue = [Issue]()
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtTitleIssue: UITextField!
    
    @IBOutlet weak var txtDecription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restAPI()
        showInfomation()
        editView()
        navigationItem.title = "Báo cáo sự cố"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown

    }
    
    @objc func showMenu(){
//        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu") as! Menu
//        let navigation = UINavigationController(rootViewController: mainVC)
//        navigation.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
    }
    
    func editView(){
        txtAddress.underlined(.gray)
        txtDecription.underlined(.gray)
        txtTitleIssue.underlined(.gray)
    }
    
    func showInfomation(){
        
    }
    
    func restAPI(){

    }
    


}
