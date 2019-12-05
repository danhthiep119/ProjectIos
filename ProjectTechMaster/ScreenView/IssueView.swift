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

    var issue = [Issue]()
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtTitleIssue: UITextField!
    
    @IBOutlet weak var txtDecription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restAPI()
        showInfomation()
    }
    func showInfomation(){
        
    }
    
    func restAPI(){
        let url = "https://jsoneditoronline.org/?id=659ed9f220104571b6e40f9f5d0243d8"
        Alamofire.request(url,method: .get,parameters: nil,encoding: URLEncoding.default,headers: nil).responseJSON{[weak self] (response) in
            guard let data = response.data, let strongSelf = self else { return }
            strongSelf.issue = IssueObject.parseData(data)
        }

    }
    


}
