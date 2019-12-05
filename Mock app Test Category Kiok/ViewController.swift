//
//  ViewController.swift
//  Mock app Test Category Kiok
//
//  Created by Steven Hertz on 12/5/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let navBarSegmentedControl: UISegmentedControl = UISegmentedControl(items: ["First", "Second"])
        navBarSegmentedControl.sizeToFit()
        navBarSegmentedControl.tintColor = UIColor(red:0.99, green:0.00, blue:0.25, alpha:1.00)
        navBarSegmentedControl.selectedSegmentIndex = 0
        navBarSegmentedControl.addTarget(self, action: #selector(ViewController.segmentedValueChanged(_:)), for: .valueChanged)
        // segment.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "ProximaNova-Light", size: 15)!], for: .normal)
        self.navigationItem.titleView = navBarSegmentedControl
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }

    
}

