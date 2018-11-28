//
//  RSScrollingLabel.swift
//  Roberto sartori
//
//  Created by Roberto Sartori on 02/11/2018.
//  Copyright © 2018 Roberto Sartori. All rights reserved.
//

import UIKit

/// Emulates UILable behaviour adding up/down text animations
@IBDesignable
public
class RSScrollingLabel: UIView {

    // MARK: -
    public enum Direction {
        case up, down, left, right
    }

    // MARK: - Private vars

    private var fromLabel: UILabel!
    private var toLabel: UILabel!

    // MARK: -
    // MARK: - Lifecycle

    init() {
        super.init(frame: CGRect())
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {
        fromLabel = UILabel()
        toLabel = UILabel()
        addSubview(fromLabel)
        addSubview(toLabel)
        layer.masksToBounds = true
        toLabel.alpha = 0
    }

    override public func layoutSubviews() {
        fromLabel.frame = bounds
        toLabel.frame = bounds
    }

    // MARK: -
    // MARK: - UILabel properties and methods

    public var font: UIFont {
        get {
            return fromLabel.font
        }
        set(newValue) {
            fromLabel.font = newValue
            toLabel.font = newValue
        }
    }

    public var textAlignment: NSTextAlignment {
        get {
            return fromLabel.textAlignment
        }
        set(newValue) {
            fromLabel.textAlignment = newValue
            toLabel.textAlignment = newValue
        }
    }

    public var textColor: UIColor {
        get {
            return fromLabel.textColor
        }
        set(newValue) {
            fromLabel.textColor = newValue
            toLabel.textColor = newValue
        }
    }

    /// Set the counter value immediatly without animations
    ///
    /// - Parameter value: desired counter value
    @IBInspectable
    public var text: String? {
        get {
            return fromLabel.text
        }
        set(newValue) {
            fromLabel.text = newValue
        }
    }

    /// Perform a scroll animation to the given value
    ///
    /// - Parameter value: final value
    public func animate(to text: String?, direction: Direction) -> Void {
        DispatchQueue.main.async {
            self.toLabel.text = text
            self.prepareAnimation(direction)
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: .curveEaseInOut,
                           animations: {
                            self.applyAnimation(direction)
            }) { (completed:Bool) in
                if completed { self.resetAnimation() }
            }
        }
    }

    // MARK: - Private functions

    private func prepareAnimation(_ direction: Direction) {
        switch direction {
        case .up:
            toLabel.frame = bounds.applying(CGAffineTransform(translationX: 0, y: bounds.height))
        case .down:
            toLabel.frame = bounds.applying(CGAffineTransform(translationX: 0, y: -bounds.height))
        case .left:
            toLabel.frame = bounds.applying(CGAffineTransform(translationX: bounds.width, y: 0))
        case.right:
            toLabel.frame = bounds.applying(CGAffineTransform(translationX: -bounds.width, y: 0))
        }
        fromLabel.frame = bounds
        toLabel.alpha = 1
    }

    private func applyAnimation(_ direction: Direction) {
        switch direction {
        case .up:
            fromLabel.frame = bounds.applying(CGAffineTransform(translationX: 0, y: -bounds.height))
        case .down:
            fromLabel.frame = bounds.applying(CGAffineTransform(translationX: 0, y: bounds.height))
        case .left:
            fromLabel.frame = bounds.applying(CGAffineTransform(translationX: -bounds.width, y: 0))
        case .right:
            fromLabel.frame = bounds.applying(CGAffineTransform(translationX: bounds.width, y: 0))
        }
        toLabel.frame = bounds
    }

    private func resetAnimation() {
        fromLabel.text = toLabel.text
        fromLabel.frame = bounds
        toLabel.alpha = 0
    }
}
