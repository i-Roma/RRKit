//
//  RS20Header.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

class RS20Header: UIView {
    
    // MARK: Properties
    
    let title = RRLabel()
    let border = UIView()
    var shouldAddBottomBorder = false {
        didSet {
            if shouldAddBottomBorder { addBorder() }
        }
    }
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        configView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configFrames()
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = .white
    }
    
    private func configView() {
        addTitle()
    }
    
    private func configFrames() {}
    
    // MARK: Actions
    
    private func addTitle() {
        addSubview(title)
        addTitleConstraints()
    }
    
    private func addTitleConstraints() {
        title.anchor(
            top: nil, leading: nil, bottom: nil, trailing: nil,
            size: CGSize(width: bounds.width / 2, height:  bounds.height / 2)
        )
        
        title.centerXRegarding(to: centerXAnchor)
        title.centerYRegarding(to: centerYAnchor)
    }
    
    // Border
    
    private func addBorder() {
        border.backgroundColor = Palette.primary.border.main
        addSubview(border)
        setBorderConstraints()
    }
    
    private func setBorderConstraints() {
        border.anchor(
            top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20),
            size: CGSize(width: bounds.width, height: 1)
        )
    }

}

