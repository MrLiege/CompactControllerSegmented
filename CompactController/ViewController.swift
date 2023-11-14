//
//  ViewController.swift
//  CompactController
//
//  Created by Artyom on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {
    var actionButton: UIButton!
    var compactVC: CompactViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionButton = UIButton(type: .system)
        actionButton.setTitle("Present", for: .normal)
        actionButton.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        
        view.backgroundColor = .white
        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65)
        ])
    }
    
    @objc func handleAction() {
        compactVC = CompactViewController()
        compactVC.modalPresentationStyle = .popover
        compactVC.popoverPresentationController?.delegate = self
        compactVC.popoverPresentationController?.sourceView = actionButton
        compactVC.popoverPresentationController?.permittedArrowDirections = .up
        present(compactVC, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
