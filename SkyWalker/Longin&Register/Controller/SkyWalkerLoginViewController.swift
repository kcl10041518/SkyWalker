//
//  SkyWalkerLoginViewController.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit

class SkyWalkerLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func loadData()  {
        
        ApiLoadingProvider.request(SkyWalkerApi.login, model: SkyWalkerLoginModel.self) { [weak self] (returnData) in
//            self?.tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
