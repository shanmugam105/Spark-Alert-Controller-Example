//
//  HomeViewController.swift
//  Spark-Alert-Controller
//
//  Created by Sparkout on 04/10/22.
//

import UIKit
import SparkAlertController

enum ActionButtons: Int, CaseIterable {
    case cancel
    case logout
    
    var title: String {
        switch self {
        case .cancel: return "Cancel"
        case .logout: return "Logout now"
        }
    }
}


class HomeViewController: UIViewController {
    let alertVC: SparkAlertController = .init()
    override func viewDidLoad() {
        super.viewDidLoad()
        let actions: [ String ] = ActionButtons.allCases.map { $0.title }
        let sparkConfig: SparkAlertConfiguration = .init(title: "Welcome!",
                                                         message: "This is test alert. You can dismiss now! Thank You!",
                                                         buttons: actions)
        alertVC.configuration = sparkConfig
        alertVC.delegate = self
    }
    
    @IBAction func makeAlretButtonTapped(_ sender: Any) {
        alertVC.modalPresentationStyle = .overCurrentContext
        present(alertVC, animated: true)
    }
}

extension HomeViewController: SparkAlertDelegate {
    
    func alertAction(for index: Int, alertController: SparkAlertController) {
        let action = ActionButtons.allCases[index]
        switch action {
        case .cancel: print("Cancel tapped")
        case .logout: print("Logout tapped")
        }
        alertController.dismiss(animated: true)
    }
}
