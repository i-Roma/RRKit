//
//  LoaderView.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

class LoaderView: UIView {

    // MARK: Properties
    
    var message: String? {
        didSet { label.text = message }
    }
    
    private var substrate = UIView()
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var label = UILabel()
    
    
    let img = UIImageView()
    
    // MARK: Life cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubstrate()
        //addSubview(img)
        addActivityIndicatory()
        addLabel()
        //img.image = #imageLiteral(resourceName: "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        setSubstrateFrame()
        setActivityIndicatoryFrame()
        setLabelFrame()
        
        let x = bounds.width / 2 - 60 / 2
        let y = (bounds.height / 2 - 60 / 2) - Indent._10pt
        img.frame = CGRect(x: x, y: y, width: 60, height: 60)
    }
    
    // Substrate
    
    private func addSubstrate() {
        substrate.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        addSubview(substrate)
    }
    
    private func setSubstrateFrame() {
        substrate.frame = CGRect(x: .zero, y: .zero, width: Screen.width, height: Screen.height)
    }
    
    // ActivityIndicatory
    
    private func addActivityIndicatory() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = Palette.primary.brand
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    // Label
    
    private func setActivityIndicatoryFrame() {
        let x = bounds.width / 2 - activityIndicator.frame.width / 2
        let y = (bounds.height / 2 - activityIndicator.frame.height / 2) - Indent._10pt
        activityIndicator.frame.origin = CGPoint(x: x, y: y)
    }
    
    private func addLabel() {
        label.text = "Loading..."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Font.primary.light, size: 12)
        substrate.addSubview(label)
    }
    
    private func setLabelFrame() {
        let width = Screen.width * 0.96
        let height: CGFloat = 20
        let x: CGFloat = Screen.width / 2 - width / 2
        let y: CGFloat = activityIndicator.frame.maxY + Indent._10pt
        label.frame = CGRect(x: x, y: y, width: width, height: height)
    }

}
