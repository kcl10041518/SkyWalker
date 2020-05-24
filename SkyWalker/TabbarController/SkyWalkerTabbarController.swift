//
//  SkyWalkerTabbarController.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit
import YYKit
class SkyWalkerTabbarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        addControllers()

        // Do any additional setup after loading the view.
    }
    
    private func addControllers() {
        
        addChildControllers(childVC: SkyWalkerContentViewController(), title: "内容", image: "Icon1", selectImage: "Icon1_1")
        addChildControllers(childVC: SkyWalkerIMViewController(), title: "聊天", image: "Icon2", selectImage: "Icon2_1")
        addChildControllers(childVC: SkyWalkerMeViewController(), title: "我的", image: "Icon3", selectImage: "Icon3_1")
        
    }

    
    
    private func addChildControllers(childVC: UIViewController, title: String, image: String, selectImage: String) {
        
//        childVC.tabBarItem.title = title
        childVC.title = title;
        childVC.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        
//        if let font = UIFont(name: "Helvetica", size: 12.0) {
//            childController.tabBarItem.setTitleTextAttributes([
//                .foregroundColor : UIColorFromRGB(0xff6742),
//                .font : font
//            ], for: .selected)
//        }
        childVC.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.font : UIFont.init(name: "Helvetica", size: 12.0) as Any
        ], for: UIControl.State.normal)
        childVC.tabBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font : UIFont.init(name: "Helvetica", size: 12.0) as Any
        ], for: UIControl.State.selected)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .selected)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], for: .normal)
        let nav = SkyWalkerBaseNavigationController(rootViewController: childVC)
        addChild(nav)
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
