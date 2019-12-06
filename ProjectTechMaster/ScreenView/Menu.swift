//
//  Menu.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/1/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class Menu: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbList: UITableView!
    @IBOutlet weak var txtTen: UILabel!
    
    @IBOutlet weak var txtSDT: UILabel!
    @IBOutlet weak var imgAvata: UIImageView!
    
    //tạo list menu
    var list:[List] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbList.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell
        cell.list = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listMenu = list[indexPath.row]
        
        switch listMenu.title {
        case "Báo cáo sự cố":
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IssueView") as! IssueView
            mainVC.modalPresentationStyle = .fullScreen
            let navigation = UINavigationController(rootViewController: mainVC)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
            break
        case "Danh sách sự cố":
            dismiss(animated: true, completion: nil)
            break
        case "Hồ sơ":
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UpdateInfomation") as! UpdateInfomation
            mainVC.modalPresentationStyle = .fullScreen
            let navigation = UINavigationController(rootViewController: mainVC)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
            break
        case "Cài đặt":
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Setting") as! Setting
            mainVC.modalPresentationStyle = .fullScreen
            let navigation = UINavigationController(rootViewController: mainVC)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
            break
        case "Đăng xuất":
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login") as! ViewController
            mainVC.modalPresentationStyle = .fullScreen
            let navigation = UINavigationController(rootViewController: mainVC)
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true, completion: nil)
            break
        default:
            print("Lỗi")
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addList()
        editView()
        
        tbList.delegate = self
        tbList.dataSource = self
    }
    
    func editView(){
        imgAvata.layer.cornerRadius = self.imgAvata.frame.height/2
    }
    
    func addList(){
        list.append(List(title: "Báo cáo sự cố", img: UIImage(named: "downArrow") ?? UIImage()))
        list.append(List(title: "Danh sách sự cố", img: UIImage(named: "send") ?? UIImage()))
        list.append(List(title: "Hồ sơ", img: UIImage(named: "user") ?? UIImage()))
        list.append(List(title: "Cài đặt", img: UIImage(named: "config") ?? UIImage()))
        list.append(List(title: "Đăng xuất", img: UIImage(named: "logout") ?? UIImage()))
    }

}
