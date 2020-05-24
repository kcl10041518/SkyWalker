//
//  SkyWalkerBaseViewController.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit

class SkyWalkerBaseViewController: UIViewController {

    
    lazy var navBarView:SkyWalkerNavigationView = {
        
        var navBarView = SkyWalkerNavigationView(frame: CGRect(x: 0, y: 0, width: Int(AppSizeWidth), height: Int(navitionbarHeight)))
        navBarView.backgroundColor = UIColor.white
        return navBarView
    }()
    
    public func showNavigationBar(title:String? = "", leftString:String, rightString:String = "" )  {
        
        self.navigationController!.navigationBar.isHidden = true;
        navBarView.showNavigationBar(title: title, leftString: leftString, rightString: rightString)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.navBarView)
        
        //  Converted to Swift 5.2 by Swiftify v5.2.29688 - https://swiftify.com/
        view.backgroundColor = UIColor.white

        if #available(iOS 11.0, *) {

            UIScrollView.appearance().contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
            automaticallyAdjustsScrollViewInsets = false
        }
        //加载侧滑返回
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        // Do any additional setup after loading the view.
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
