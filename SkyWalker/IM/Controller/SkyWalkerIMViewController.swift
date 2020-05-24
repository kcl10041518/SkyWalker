//
//  SkyWalkerIMViewController.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit

class SkyWalkerIMViewController: SkyWalkerBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.tableView)
        self.showNavigationBar(title: "聊天", leftString: "", rightString: "")
        
        // Do any additional setup after loading the view.
    }
    lazy var tableView: UITableView = {
        
    let tabView = UITableView.init(frame: CGRect(x:0, y:navitionbarHeight, width:AppSizeWidth, height: AppSizeHeight-navitionbarHeight-bottomSafebarHeight-tabbarHeight), style: .grouped)
    tabView.delegate = self
    tabView.dataSource = self
    tabView.estimatedRowHeight = 0;
    tabView.estimatedSectionFooterHeight = 0;
    tabView.estimatedSectionHeaderHeight = 0;
    tabView.backgroundColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
    tabView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tabView.separatorStyle = UITableViewCell.SeparatorStyle.none
    return tabView
    }()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SkyWalkerIMViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = "聊天"
        return cell;
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}
