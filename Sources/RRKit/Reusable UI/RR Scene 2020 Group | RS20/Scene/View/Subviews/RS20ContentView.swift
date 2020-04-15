//
//  RS20ContentView.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

class RS20ContentView: UIView {

    // MARK: IBOutlets
    
    let header = RS20Header()   
    let list = CollectionView()
    
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
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = .white
    }
    
    private func configView() {
        addHeader()
        addList()
    }
    
    // Create header
    
    private func addHeader() {
        addSubview(header)
        addHeadersConstraints()
    }
    
    private func addHeadersConstraints() {
        header.anchor(
            top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            size: CGSize(width: bounds.width, height:  FixedSize._44pt)
        )
    }
    
    // Create list
    
    private func addList() {
        list.backgroundColor = .white
        addSubview(list)
        setListConstraints()
    }
    
    private func setListConstraints() {
        list.anchor(
            top: header.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor
        )
    }

}
