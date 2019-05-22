//
//  VerticalStackView.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) {
        
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({ addArrangedSubview($0) })
        
        self.spacing = spacing
        self.distribution = distribution
        self.axis = axis
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
