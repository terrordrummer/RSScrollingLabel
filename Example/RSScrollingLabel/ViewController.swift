//
//  ViewController.swift
//  RSScrollingLabel
//
//  Created by terrordrummer on 11/23/2018.
//  Copyright (c) 2018 terrordrummer. All rights reserved.
//

import UIKit
import RSScrollingLabel

class ViewController: UIViewController {

    @IBOutlet weak var scrollingLabel: RSScrollingLabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollingLabel.layer.borderWidth = 1
        scrollingLabel.layer.borderColor = UIColor.black.cgColor
        scrollingLabel.layer.cornerRadius = 5
        scrollingLabel.textAlignment = .center
        scrollingLabel.font = UIFont(name: "HelveticaNeue", size: 12)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions

    @IBAction func scrollUp() {
        scrollingLabel.animateTo(text: "Scroll Up", direction: .up)
    }

    @IBAction func scrollDown() {
        scrollingLabel.animateTo(text: "Scroll Down", direction: .down)
    }
}

