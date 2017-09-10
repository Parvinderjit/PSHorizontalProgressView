//
//  ViewController.swift
//  PSHorizontalProgressView
//
//  Created by Girish Sami on 10/09/17.
//  Copyright © 2017 Girish Sami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var progressView: ProgressView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	@IBAction func start(_ sender: Any) {
		progressView.startAnimate()
	}
	@IBAction func stop(_ sender: Any) {
		progressView.stopAnimate()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

