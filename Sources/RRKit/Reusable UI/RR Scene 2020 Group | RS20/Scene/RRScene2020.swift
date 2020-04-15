//
//  RRScene2020.swift
//  Created by Roman Romanenko
//  Copyright © Always Roman Romanenko. All rights reserved.
//

import UIKit

open class RRScene2020: UIViewController {
    
    // MARK: Properties
    
    let _view = RS20View(frame: UIScreen.main.bounds)

    // MARK: Life cycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        attachView()
    }

    // MARK: Method
    
    func attachView() {
        attachViewToSafeArea(_view)
    }
}
