import Foundation
import UIKit

struct Alert {
    
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
    }
    
    private static func showChangeAlert(vc: UIViewController, title: String, message: String, completion: @escaping() -> Void) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        DispatchQueue.main.async {
            vc.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    static func showResultAlert(vc: UIViewController, message: String) {
        showSimpleAlert(vc: vc, title: "Result", message: message)
    }
    
    static func showErrorAlert(vc: UIViewController, message: String, completion: @escaping() -> Void) {
        showChangeAlert(vc: vc, title: "Error", message: message, completion: completion)
    }
}
