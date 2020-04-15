//
//  CollectionView.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    // MARK: Public property
    
    public var spacingBetweenCells: CGFloat = 0
    public var messageLabel: UILabel?
    
    // MARK: Private property
    
    private var indicatorView = UIActivityIndicatorView()
    private var loaderView = LoaderView()
    
    // MARK: Life cycle
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout = UICollectionViewLayout()) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = .zero
        super.init(frame: frame, collectionViewLayout: layout)
        
        //setupMessageLabel()
    }
    
    /* ?
     convenience init(frame: CGRect = .zero) {
        self.init(frame: frame)
    }
     */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setIndicatorViewFrame()
        setLoaderViewFrame()
    }
    
    // MARK: Method
    
    private func settings() {}
    
}

extension CollectionView {
    
    public func reloadWithAnimation(duration: TimeInterval = 0.2, options: UIView.AnimationOptions = .transitionCrossDissolve) {
        
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: duration, options: options, animations: {
                self.reloadData()
            })
        }
    }
    
}

// MARK: Message label

extension CollectionView {
    
    public func setupMessageLabel(_ message: String = String(), textColor: UIColor = Palette.primary.text.subtitle) {

        messageLabel = UILabel()
        messageLabel?.backgroundColor = backgroundColor
        messageLabel?.text = message
        messageLabel?.textColor = textColor
        messageLabel?.numberOfLines = 0
        messageLabel?.textAlignment = .center
        messageLabel?.font = UIFont(name: Font.primary.light, size: 14)
        //messageLabel?.sizeToFit()
        setMessageLabelFrame()
        
        self.backgroundView = messageLabel
    }
    
    public func resetMessageLabel() {
        
        DispatchQueue.main.async {
            self.messageLabel?.text = String()
        }
    }
    
    private func setMessageLabelFrame() {
        let width = bounds.width * 0.9
        let height = bounds.height * 0.2
        let x = bounds.width / 2 - width / 2
        let y = bounds.height / 2 - height / 2
        messageLabel?.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
}

// MARK: Loader view

extension CollectionView {
    
    public func removeLoaderView() {
        loaderView.removeFromSuperview()
    }
    
    public func showLoaderView() {
        addSubview(loaderView)
    }
    
    private func setLoaderViewFrame() {
        loaderView.frame = frame
    }
    
}

// MARK: Indicator view

extension CollectionView {
    
    public func removeIndicatorView() {
        DispatchQueue.main.async {
            self.indicatorView.removeFromSuperview()
        }
    }
    
    public func showIndicatorView() {
        indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = Palette.primary.brand
        
        DispatchQueue.main.async {
            self.addSubview(self.indicatorView)
            self.indicatorView.startAnimating()
        }
    }
    
    private func setIndicatorViewFrame() {
        let x = bounds.width / 2 - indicatorView.frame.width / 2
        let y = (bounds.height / 2 - indicatorView.frame.height / 2) - Indent._10pt
        indicatorView.frame.origin = CGPoint(x: x, y: y)
    }
    
}

