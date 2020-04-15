//
//  RS20View.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

open class RS20View: UIView {
    
    // MARK: Properties
    
    let header = RS20Header()
    var headerHeight: CGFloat = 300 {
        didSet {
            UIDevice.vibrate(.soft)
            UIView.animate(withDuration: 1, delay: 0.25, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.heightConstraint?.constant = self.headerHeight
                self.layoutIfNeeded()
            })
        }
    }
    var heightConstraint: NSLayoutConstraint?
    let containerView = UIView()
    let scrollView = UIScrollView()
    let subheader = RS20Header()
    let contentView = RS20ContentView()
    
    // MARK: Life cycle
    
    open required init?(coder aDecoder: NSCoder) {
        fatalError(aDecoder.error.debugDescription)
    }
    
    open override init(frame: CGRect) {
        super.init(frame: frame)
        
        settings()
        configView()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setScrollContentSize()
        //containerView.corner(radius: 24)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        superview?.willMove(toSuperview: newSuperview)
        
        containerView.corner(radius: 24)
    }
    
    // MARK: Methods
    
    private func settings() {
        backgroundColor = Palette.primary.brand
    }
    
    private func configView() {
        addHeader()
        addContainerView()
        addSubheader()
        addScrollView()
        addContentView()
    }
    
    // MARK: Actions
    
    private func addHeader() {
        addSubview(header)
        addHeadersConstraints()
    }
    
    private func addHeadersConstraints() {
       header.translatesAutoresizingMaskIntoConstraints = false
       translatesAutoresizingMaskIntoConstraints = false
       header.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
       header.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
       header.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
       header.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
       heightConstraint = header.heightAnchor.constraint(equalToConstant: headerHeight)
       heightConstraint?.isActive = true
    }
    
    // Container view

    private func addContainerView() {
        containerView.backgroundColor = .systemYellow
        addSubview(containerView)
        addContainerViewConstraints()
    }

    private func addContainerViewConstraints() {
        containerView.anchor(
            top: header.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor
        )
    }
    
    // Subheader

    private func addSubheader() {
        containerView.addSubview(subheader)
        addSubheaderConstraints()
    }

    private func addSubheaderConstraints() {
        subheader.anchor(
            top: containerView.topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,
            size: CGSize(width: bounds.width, height:  FixedSize._44pt)
        )
    }
    
    // Scroll view
    
    private func addScrollView() {
        //scrollView.backgroundColor = .systemTeal
        scrollView.delegate = self
        containerView.addSubview(scrollView)
        setScrollViewConstraints()
    }
    
    private func setScrollViewConstraints() {
        
        scrollView.anchor(
            top: subheader.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor
        )
    }
    
    private func setScrollContentSize() {
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: (header.bounds.height * 4))
    }
    
    // Content view
    
    private func addContentView() {
        //contentView.backgroundColor = .systemYellow
        scrollView.addSubview(contentView)
        setContentViewConstraints()
    }
    
    private func setContentViewConstraints() {
        contentView.anchor(
            top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor,
            size: CGSize(width: bounds.width, height: bounds.height)
        )
    }
}

// MARK: --- --- --- --- --- --- --- --- --- --- --- --- --- UIScrollViewDelegate

extension RS20View: UIScrollViewDelegate {
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        let height = header.frame.height - scrollView.contentOffset.y
        let scaleY = height / header.frame.height
        // header.frame = CGRect(x: 0, y: 0, width: bounds.width, height: height)
        
        guard scrollView.isTracking else {

            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
                self.heightConstraint?.constant = self.headerHeight
                self.layoutIfNeeded()
            })
    
            return
        }
        
        guard scrollView.contentOffset.y < 0 else { return }
        
        print("scrollView.contentOffset.y", scrollView.contentOffset.y)
        print("height", header.frame.height)
        print("new height", height)
        print("scaleY", scaleY)

        guard height < 400 else { return }

        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            self.heightConstraint?.constant = height
            self.layoutIfNeeded()
        })
                
    }
    
}
