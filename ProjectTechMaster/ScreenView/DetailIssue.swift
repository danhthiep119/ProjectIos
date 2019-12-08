//
//  DetailIssue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/5/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class DetailIssue: UIViewController {
//    var issue : Issue?
    @IBOutlet weak var txtProcess: UILabel!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDecription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        editView()
        loadData()
//        print(issue?.address)
        navigationItem.title = "Chi tiết sự cố"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func showMenu(){
        navigationController?.popViewController(animated: true )
    }
    
    func loadData(){
//        self.txtTitle?.text = issue?.title
//        self.txtProcess?.text = issue?.processed
//        self.txtAddress?.text = issue?.address
//        self.txtDecription?.text = issue?.time
        
    }
    
    func editView(){
        txtAddress?.underlined(.gray)
        txtTitle?.underlined(.gray)
        txtDecription?.underlined(.gray)
        
    }
    

}
