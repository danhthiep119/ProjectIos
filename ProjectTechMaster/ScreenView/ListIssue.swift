//
//  ListIssue.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/3/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
class ListIssue: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbIssue: UITableView!

    
    
    var issue:[IssueDataDetail] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let issues = issue[indexPath.row]
        let cell = tbIssue.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as! CustomViewCell
        cell.txtTime.text = issues.timeissue
        cell.txtDate.text = issues.dateissue
        cell.txtAddress.text = issues.addressissue
        cell.txtTitle.text = issues.titleissue
        
//        cell.setIssue(issue: issues)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let issues = issue[indexPath.row]
//        guard let id = issues.id else { return}
//        guard let processed = issues.processed else { return}
//        guard let title = issues.title else { return}
//        guard let address = issues.address else { return}
//        guard let time = issues.time else { return}
//        guard let date = issues.date else { return}
////        passData(Issue(id: id, processed: processed, title: title, address: address, time: time, date: date))
//        print(processed)
//        let mainVC = DetailIssue()
//        mainVC.issue?.id = id
//        mainVC.issue?.processed = processed
//        mainVC.issue?.title = title
//        mainVC.issue?.address = address
//        mainVC.issue?.time = time
//        mainVC.issue?.date = date
//
////        let navigation = UINavigationController(rootViewController: mainVC)
////        navigation.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(mainVC, animated: true)
//    }
    
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
        for info in issue
        {
            print("\(info.titleissue)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailIssue = segue.destination as?  DetailIssue,
        let index = tbIssue.indexPathForSelectedRow?.row else { return}
//        detailIssue.issue = issue[index]
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
//        let token = UserDefaults.standard.string(forKey: "token") ?? ""
//        let setHeader = [
//            "Authorization":  token
//        ]
//                let url = "http://45.118.145.149:8100/issues?status=-1&keyword="
//        Alamofire.request(url, method: .get,encoding: JSONEncoding.default, headers: HTTPHeaders(setHeader), interceptor:nil ).responseObject { (response: DataResponse<IssueResult>) in
//                    let profileResponse = response.value
//                    print(response.result)
//                    if profileResponse?.code == 0 {
//                        if let result = profileResponse?.data {
//                            self.issue = result.issues
//                            self.tbIssue.reloadData()
//                        }
//                    }
//                }
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
