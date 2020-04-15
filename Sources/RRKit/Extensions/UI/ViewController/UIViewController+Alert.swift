//
//  UIViewController+Alert.swift
//

import UIKit

fileprivate struct Alert {
    static let title = appName
    static let ok = "Ok"
}

extension UIViewController {
    
    func showAlert(title: String? = nil, with message: String, okButtonTitle: String = Alert.ok) -> Void {

        let title = title == nil ? Alert.title : title
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithHandler(title: String = Alert.title, message: String, handler: @escaping () -> Void) -> Void {
        
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Alert.ok, style: .default, handler: { (action) -> Void in
            handler()
        })
        dialogMessage.addAction(ok)
        
        DispatchQueue.main.async {
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    func alertAndRedirectionToSettings(with message: String) {
        let alertController = UIAlertController(title: appName, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Alert.ok, style: .cancel, handler: { (action) in
            self.dismiss(animated: false)
            UIApplication.openSettings()
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    func alertAndRedirectionToSettings(with message: String, handler: @escaping () -> Void) {
        let alertController = UIAlertController(title: appName, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Alert.ok, style: .cancel, handler: { (action) in
            self.dismiss(animated: false)
            UIApplication.openSettingsWithCompletion {
                handler()
            }
        })
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
}

