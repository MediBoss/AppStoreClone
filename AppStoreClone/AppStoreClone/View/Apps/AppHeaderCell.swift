//
//  AppHeaderCell.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/16/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class AppHeaderCell: UICollectionViewCell {
    
    let companyNameLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    let blurbLabel = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 25))
    
    let posterImageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        posterImageView.backgroundColor = .red
        blurbLabel.numberOfLines = 2
        let stackView = CustomStackView(arrangedSubviews: [companyNameLabel, blurbLabel, posterImageView],
                                        spacing: 12,
                                        axis: .vertical,
                                        distribution: .fill)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
