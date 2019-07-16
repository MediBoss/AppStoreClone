//
//  AppRowCell.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/9/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    
    let appIconImageView = UIImageView(cornerRadius: 8)
    let appNameLabel = UILabel(text: "AppName", font: .systemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getAppButton = UIButton(title: "GET")

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        layoutCellItems()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCellItems() {

        appIconImageView.constrainWidth(constant: 64)
        appIconImageView.constrainHeight(constant: 64)
        
        getAppButton.backgroundColor = UIColor(white: 0.93, alpha: 1)
        getAppButton.constrainWidth(constant: 80)
        getAppButton.constrainHeight(constant: 32)
        getAppButton.layer.cornerRadius = 16
        
        let labelStackView = UIStackView(arrangedSubviews: [appNameLabel, companyLabel])
        labelStackView.axis = .vertical
        
        let mainStackView = UIStackView(arrangedSubviews: [appIconImageView, labelStackView, getAppButton])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 12
        
        addSubview(mainStackView)
        mainStackView.fillSuperview()
    }
}
