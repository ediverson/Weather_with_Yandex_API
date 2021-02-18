import UIKit
//MARK: - Create add Alert
extension UIViewController {
    func alertPlusCity(name: String, plaseholer: String, completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let alertOk = UIAlertAction(title: "Добавить", style: .default) { (action) in
            let textField = alertController.textFields?.first
            guard let text = textField?.text else { return }
            completion(text)
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = plaseholer
        }
        
        let alertCancel = UIAlertAction(title: "Отменить", style: .default) { (_) in }
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
}
