//
//  Setting.swift
//  ProjectTechMaster
//
//  Created by Cuong DT on 12/5/19.
//  Copyright © 2019 Cuong DT. All rights reserved.
//

import UIKit

class Setting: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var setting:[String] = []
    @IBOutlet weak var tbSetting: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbSetting.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        cell.txtTitleSetting.text = setting[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSetting()
        
        tbSetting.delegate = self
        tbSetting.dataSource = self
        tbSetting.register(UINib(nibName: "SettingCell", bundle: nil),forCellReuseIdentifier: "SettingCell")
        navigationItem.title = "Cài Đặt"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationController?.navigationBar.barTintColor = .brown

        
    }
    @objc func showMenu(){
        dismiss(animated: true, completion: nil)
    }
    func addSetting(){
        setting.append("Đổi mật khẩu")
    }
}
