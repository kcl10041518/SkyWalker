//
//  SkyWalkerBaseNavigationController.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit

class SkyWalkerBaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    var popDelegate:UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationBar字体颜色设置
        self.navigationBar.barTintColor = UIColor.black
        //navigationBar字体颜色设置
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        self.popDelegate = self.interactivePopGestureRecognizer?.delegate
        self.delegate = self
    }
    
    
    /// 重写Push方法
    /// 所有的push动作都会调用此方法
    /// - Parameters:
    ///   - viewController: 需要push的VC
    ///   - animated: 是否动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //如果不是栈底的控制器才需要隐藏，根控制器不需要处理
        if children.count > 0{
            //隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
            self.interactivePopGestureRecognizer?.isEnabled = true
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    //MARK: - UIGestureRecognizerDelegate代理
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //实现滑动返回的功能
        //清空滑动返回手势的代理就可以实现
        if viewController == self.viewControllers[0] {
            
            self.interactivePopGestureRecognizer?.delegate = self.popDelegate
            
        } else {
            
            self.interactivePopGestureRecognizer?.delegate = nil;
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
