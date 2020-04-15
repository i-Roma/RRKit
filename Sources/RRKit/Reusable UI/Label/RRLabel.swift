//
//  RRLabel.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

protocol RRLabelDelegate: AnyObject {
    func labelDidTap()
}

class RRLabel: UILabel {
    
    // MARK: Delegate
    
    weak var delegate: RRLabelDelegate?
    
    // MARK: Properties
    
    var titleText = String() {
        didSet {
            text = titleText
        }
    }
    
    var titleColor: UIColor = .black {
        didSet {
            textColor = titleColor
        }
    }
    
    var titleAlignment: NSTextAlignment = .left {
        didSet {
            textAlignment = titleAlignment
        }
    }
    
    var titleFontName = String() {
        didSet {
            font = UIFont(name: titleFontName, size: fontSize)
        }
    }
    
    var titleSize: CGFloat = 0 {
        didSet {
            font = UIFont(name: font.familyName, size: titleSize)
        }
    }
    
    var shouldAddTapGesture = false {
        didSet {
            guard shouldAddTapGesture else { return }
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
            isUserInteractionEnabled = true
            addGestureRecognizer(tap)
        }
    }
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        font = UIFont(name: Font.primary.font, size: fontSize)
    }
    
    // MARK: Action
    
    @objc func tapAction(sender: UITapGestureRecognizer) {
        delegate?.labelDidTap()
    }
    
    public func setRight(_ icon: UIImage?, _ iconSize: CGSize, _ iconContainerViewWidth: CGFloat? = nil) {
        let newRightViewWidth = iconContainerViewWidth != nil ? iconContainerViewWidth! : bounds.height
        
        let iconContainerView = UIView(frame: CGRect(x: bounds.width - newRightViewWidth, y: .zero, width: newRightViewWidth, height: bounds.height))
        addSubview(iconContainerView)
        
        let iconView =  UIImageView()
        iconView.image = icon
        iconView.frame.size = iconSize
        iconContainerView.addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        iconView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor).isActive = true
    }
    
}
