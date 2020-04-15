//
//  NavigationAssistant.swift
//

import UIKit

class NavigationAssistant {
    
    /*static func setRoot(_ viewController: UIViewController, _ window: UIWindow?, _ scene: UIScene) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = ScrollableViewController()
        window?.makeKeyAndVisible()
        
    }
    
    static func transition(to viewController: UIViewController, animated: Bool = true, duration: Double = 0.25, options: UIView.AnimationOptions = []) {
        guard let window = scene?.window else { return }
        
        if animated {
            
            var option: UIView.AnimationOptions = .transitionCrossDissolve
            if options != [] {
                option = options
            }
            
            UIView.transition(with: window, duration: duration, options: option, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                
                let oldVC = window.rootViewController
                window.rootViewController = viewController
                oldVC?.dismiss(animated: false, completion: nil)
                UIView.setAnimationsEnabled(oldState)
            })
            
        } else {
            window.rootViewController?.dismiss(animated: false, completion: nil)
            window.rootViewController = viewController
        }
    }*/
    
}

