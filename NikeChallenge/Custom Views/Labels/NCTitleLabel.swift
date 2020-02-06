//
//  NCTitleLabel.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/6/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NCTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    convenience init(fontSize: CGFloat, fontWeight weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
    }
    
    private func configure() {
        textColor = .label
        font = UIFont.systemFont(ofSize: 14, weight: .regular)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byWordWrapping
        numberOfLines = 3
        translatesAutoresizingMaskIntoConstraints = false
    }
}
