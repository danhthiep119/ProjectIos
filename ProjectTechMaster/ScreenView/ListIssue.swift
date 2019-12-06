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
    
    var issue:[Issue] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let issues = issue[indexPath.row]
        let cell = tbIssue.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as! CustomViewCell
        cell.txtTime.text = issues.time
        cell.txtDate.text = issues.date
        cell.txtAddress.text = issues.address
        cell.txtTitle.text = issues.title
        
//        cell.setIssue(issue: issues)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let passData = DetailIssue()
        passData.issue?.title = issue[indexPath.row].title
        passData.issue?.processed = issue[indexPath.row].processed
        passData.issue?.address = issue[indexPath.row].address
        passData.issue?.time = issue[indexPath.row].time
//        passData.txtAddress?.text = listIssue.address
//        passData.txtProcess?.text = listIssue.processed
//        passData.txtDecription?.text = listIssue.date
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailIssue") as! DetailIssue
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbIssue.delegate = self
        tbIssue.dataSource = self
        tbIssue.register(UINib(nibName: "CustomViewCell", bundle: nil),forCellReuseIdentifier: "CustomViewCell")
        addData()
        navigationItem.title = "Danh sách sự cố"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addMore))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown

        
    }
    
    func addData(){
        let issue1 = Issue(id: 1, processed: "Chưa sửa chữa", title: "Vỡ Ống Nước", address: "Thanh Xuân Hà Nội", time: "11:58", date: "25/5/2019")
        let issue2 = Issue(id: 2, processed: "Chưa sửa chữa", title: "Vỡ Gạch", address: "Thanh Xuân Hà Nội", time: "11:58", date: "25/5/2019")
        let issue3 = Issue(id: 3, processed: "Chưa sửa chữa", title: "Gãy Ống Nước", address: "Thanh Xuân Hà Nội", time: "11:58", date: "25/5/2019")
        
        issue.append(issue1)
        issue.append(issue2)
        issue.append(issue3)
    }
    
    func restAPI(){
        
    }
    
    @objc func showMenu(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Menu") as! Menu
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .overFullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
    @objc func addMore(){
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IssueView") as! IssueView
        let navigation = UINavigationController(rootViewController: mainVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
