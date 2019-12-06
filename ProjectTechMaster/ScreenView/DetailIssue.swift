//
//  DetailIssue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/5/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class DetailIssue: UIViewController {
    var issue : Issue?
    @IBOutlet weak var txtProcess: UILabel!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDecription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtProcess.text =  issue?.processed
        self.txtTitle.text = issue?.title
        self.txtAddress.text = issue?.address
        self.txtDecription.text = issue?.date
        editView()
        navigationItem.title = "Chi tiết sự cố"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown
    }
    
    @objc func showMenu(){
        dismiss(animated: true, completion: nil)
    }
    
    func editView(){
        txtAddress.underlined(.gray)
        txtTitle.underlined(.gray)
        txtDecription.underlined(.gray)
        
    }
    

}
