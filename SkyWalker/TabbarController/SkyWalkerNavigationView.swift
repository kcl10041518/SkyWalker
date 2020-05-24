//
//  SkyWalkerNavigationView.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit


class SkyWalkerNavigationView: UIView {

    private let kNavBarLeftMargin:CGFloat = 15
    private let kNavBarTitleLength = pSize(450)
    lazy var titleLabel:UILabel = {
        var titleLabel = UILabel();
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.numberOfLines = 0;
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: pSize(54))
        return titleLabel;
    }()
    
    lazy var leftButton :UIButton = {
        
        var leftButton = UIButton.init(type: UIButton.ButtonType.custom)
        leftButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: pSize(54))
        leftButton.contentHorizontalAlignment = .left
        leftButton.setImage(UIImage(named: "icon_left"), for: UIControl.State.normal)
        leftButton.setImage(UIImage(named: "icon_left"), for: UIControl.State.selected)
        leftButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        leftButton.addTarget(self, action: #selector(leftButtonClick), for: UIControl.Event.touchUpInside)
        leftButton.sizeToFit()
        return leftButton;
    }()
    lazy var rightButton :UIButton = {
        
        var rightButton = UIButton.init(type: UIButton.ButtonType.custom)
        rightButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: pSize(54))
        rightButton.contentHorizontalAlignment = .right
        rightButton.setImage(UIImage(named: "icon_right"), for: UIControl.State.normal)
        rightButton.setImage(UIImage(named: "icon_right"), for: UIControl.State.selected)
        rightButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightButton.addTarget(self, action: #selector(leftButtonClick), for: UIControl.Event.touchUpInside)
        rightButton.sizeToFit()
        return rightButton;
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(self.titleLabel)
        self.addSubview(self.leftButton)
        self.addSubview(self.rightButton)
        
        self.autoresizingMask = .flexibleWidth
        makeCOnstraints()
    }
    
    func makeCOnstraints()  {
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(topStatuHeight)
            make.width.equalTo(kNavBarTitleLength)
            make.height.equalTo(NavBarHeight)
        }
        self.leftButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.titleLabel.centerY)
            make.size.equalTo(CGSize(width: pSize(172), height: pSize(72)))
            make.left.equalTo(kNavBarLeftMargin)
        }
        
        self.rightButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.titleLabel.centerY)
            make.right.equalTo(kNavBarLeftMargin)
            make.size.equalTo(CGSize(width: pSize(172), height: pSize(72)))
        }
        
    }
    
    
    public func showNavigationBar(title:String? = "", leftString:String, rightString:String = "" ) {
        
        setLeftButton(title: leftString )
        setRightButton(title: rightString )
        setTitleLabel(title: title!)
    }
    
    
    private func setTitleLabel(title:String) {
        
        if !ISStrEmpty(value: title as AnyObject) {
            
            titleLabel.isHidden = false
            titleLabel.text = title
        } else {
            
            titleLabel.isHidden = true
        }
    }
    
    private func setLeftButton(title:String) {
        
        if !ISStrEmpty(value: title as AnyObject) {
            
            if (title.range(of: ".png") != nil) {
                
                leftButton.setImage(UIImage(named: title), for: UIControl.State.normal)
                leftButton.setImage(UIImage(named: title), for: UIControl.State.highlighted)
                leftButton.setTitle(nil, for: UIControl.State.normal)
            } else {
                leftButton.setTitle(title, for: UIControl.State.normal)
                leftButton.setImage(nil, for: UIControl.State.normal)
            }
            leftButton.isHidden = false
        } else {
            leftButton.setTitle(nil, for: UIControl.State.normal)
            leftButton.setImage(nil, for: UIControl.State.normal)
            leftButton.isHidden = true
        }
    }
    
    private func setRightButton(title:String) {
        
        if !ISStrEmpty(value: title as AnyObject) {
            
            if (title.range(of: ".png") != nil) {
                
                rightButton.setImage(UIImage(named: title), for: UIControl.State.normal)
                rightButton.setImage(UIImage(named: title), for: UIControl.State.highlighted)
                rightButton.setTitle(nil, for: UIControl.State.normal)
            } else {
                rightButton.setTitle(title, for: UIControl.State.normal)
                rightButton.setImage(nil, for: UIControl.State.normal)
            }
            rightButton.isHidden = false
        } else {
            
            rightButton.setTitle(nil, for: UIControl.State.normal)
            rightButton.setImage(nil, for: UIControl.State.normal)
            rightButton.isHidden = true
        }
    }
    
    
    @objc func leftButtonClick(){
       
    }
    
    @objc func rightButtonClick(){
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
