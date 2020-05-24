//
//  SkyWalkerMeTableViewCell.swift
//  SkyWalker
//
//  Created by kongchenliang on 2020/5/23.
//  Copyright © 2020 kongchenliang. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class SkyWalkerMeTableViewCell: UITableViewCell {

    lazy var picImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20.0
        return imageView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = DominantColor
        button.setTitle("阅读漫画", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI(){
        
        self.addSubview(self.picImageView)
        self.picImageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(15)
            make.right.bottom.equalToSuperview().offset(-15)
        }
        
        self.picImageView.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.right.bottom.equalToSuperview().offset(-25)
            make.height.equalTo(30)
        }
    }
    
    var meModel:SkyWalkerMeModel? {
        
        didSet {
            guard let model = meModel else { return }
            self.picImageView.kf.setImage(with: URL(string: model.url!))
//           self.picImageView.kf.setImage(with: URL(string:model.cover!))
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
