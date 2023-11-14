//
//  CompactViewController.swift
//  CompactController
//
//  Created by Artyom on 14.11.2023.
//

import Foundation
import UIKit

class CompactViewController: UIViewController {
    var segmentedControl: UISegmentedControl!
    var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl = UISegmentedControl(items: ["280pt", "150pt"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        exitButton = UIButton(type: .system)
        exitButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        exitButton.addTarget(self, action: #selector(handleExit), for: .touchUpInside)
        
        view.backgroundColor = .systemGray5
        view.addSubview(segmentedControl)
        view.addSubview(exitButton)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            exitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        preferredContentSize.height = 280
    }
    
    @objc func handleSegmentChange() {
        preferredContentSize.height = segmentedControl.selectedSegmentIndex == 0 ? 280 : 150
    }
    
    @objc func handleExit() {
        dismiss(animated: true)
    }
}
