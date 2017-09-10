//
//  ProgressView.swift
//  PSHorizontalProgressView
//
//  Created by Girish Sami on 10/09/17.
//  Copyright © 2017 Girish Sami. All rights reserved.
//

import UIKit

class ProgressView:UIView {
	
	@IBInspectable var animatingBackgroundColor:UIColor = .white
	
	private var actualBackgroundColor:UIColor!
	private(set) var isAnimating:Bool = false
	private var internalView:UIView = UIView();
	private var internalViewWidth:CGFloat = 30
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.internalView.frame.size.height = bounds.height
		internalViewWidth = self.bounds.width * 0.25
		self.internalView.frame.size.width = CGFloat(internalViewWidth)
		resetLocation()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		resetLocation()
		self.internalView.backgroundColor = self.tintColor
		self.addSubview(self.internalView)
		self.actualBackgroundColor = self.backgroundColor
		self.clipsToBounds = true
	}
	
	private func resetLocation() {
		internalView.frame.origin = CGPoint.init(x: -internalViewWidth, y: 0)
	}
	
	private func animate() {
		UIView.animate(withDuration: 1, animations: { 
			self.internalView.frame.origin = CGPoint.init(x: self.bounds.width, y: 0)
		}) { (success) in
			if self.isAnimating {
				self.resetLocation()
				self.animate()
			}
		}
	}
	
	func startAnimate() {
		if self.isAnimating { return }
		self.isAnimating = true
		self.backgroundColor = self.animatingBackgroundColor
		resetLocation()
		self.internalView.isHidden = false
		self.animate()
	}
	func stopAnimate() {
		if !self.isAnimating { return }
		self.internalView.isHidden = true
		self.backgroundColor = self.actualBackgroundColor
		self.isAnimating = false
	}
}
