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
