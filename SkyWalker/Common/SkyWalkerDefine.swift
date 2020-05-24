//
//  SkyWalkerDefine.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit



//MARK: IphoneType define

let IIphoneType4 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneType5 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneType6 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneType6P =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneType6pScale =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2001).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneTypeX =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneTypeXr =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneTypeXs =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) : false)

let IphoneTypeXsMax =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) : false)

//MARK: AppSize define
let AppSizeBounds = UIScreen.main.bounds
let AppSizeHeight:CGFloat = UIScreen.main.bounds.height
let AppSizeWidth:CGFloat = UIScreen.main.bounds.width
let topStatuHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height
let tabbarHeight:CGFloat = (topStatuHeight > 20 ? 83:49)  // 适配iPhone x 底栏高度
let navitionbarHeight:CGFloat = (topStatuHeight > 20 ? 88:64)  // 适配iPhone x 底栏高度
let bottomSafebarHeight:CGFloat = (topStatuHeight > 20 ? 34:0)  // 适配iPhone x 底栏高度
let StatusBarHeight:CGFloat = UIApplication.shared.statusBarFrame.size.height//状态栏高度
let NavBarHeight:CGFloat = 44.0


//MARK: AppColor define
let DominantColor = UIColor.init(red: 239/255.0, green: 80/255.0, blue: 88/255.0, alpha: 1)
let FooterViewColor = UIColor.init(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)


//MARK: App
func pSize(_ x:CGFloat) -> CGFloat {
    
    return x*CGFloat((AppSizeWidth/1080.0))
}

func Localizable(key:String) -> String {
    return NSLocalizedString(key, comment: "")
}

func ISStrEmpty(value: AnyObject?) -> Bool {
    //首先判断是否为nil
    if (nil == value) {
        //对象是nil，直接认为是空串
        return true
    }else{
        //然后是否可以转化为String
        if let myValue  = value as? String{
            //然后对String做判断
            return myValue == "" || myValue == "(null)" || 0 == myValue.count
        }else{
            //字符串都不是，直接认为是空串
            return true
        }
    }
}


func PrintDebug<T>(_ message:T, file: String = #file, methodsName: String = #function, line: Int = #line){
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("class: \(fileName)\nmethod: \(methodsName)\nline: \(line)\n\(message)\n")
    #endif
}

#if DEBUG //测试环境
let BaseUrl = "http://httpbin.org/"
#else
let BaseUrl = "http://httpbin.org/"
#endif
