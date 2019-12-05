//
//  ListIssue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
class ListIssue: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbIssue: UITableView!
    
    var issue = [Issue]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbIssue.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomViewCell
        cell.txtTime?.text = issue[indexPath.row].time
        cell.txtDate?.text = issue[indexPath.row].date
        cell.txtAddress?.text = issue[indexPath.row].add
        cell.txtTitle?.text = issue[indexPath.row].title
        self.tbIssue.reloadData()
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Danh sách sự cố"
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addMore))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        restAPI()
        
    }
    
    func restAPI(){
        
        let url = "https://jsoneditoronline.org/?id=659ed9f220104571b6e40f9f5d0243d8"
        Alamofire.request(url,method: .post,parameters: nil,encoding: URLEncoding.default,headers: nil).responseJSON{[weak self] (response) in
            guard let data = response.data, let strongSelf = self else { return }
            strongSelf.issue = IssueObject.parseData(data)
        }
    }
    
    
    @objc func addMore(){
    
    }
    

    

}
