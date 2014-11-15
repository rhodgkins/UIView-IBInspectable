//
//  UIView_IBInspectableTests.swift
//  UIView+IBInspectableTests
//
//  Created by Richard Hodgkins on 15/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import UIKit
import XCTest

import UIView_IBInspectable

struct TestComparison {
    // Initial values are UIView defaults
    var cornerRadius: Double = 0
    var borderWidth: Double = 0
    var borderColor: UIColor? = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    var shadowColor: UIColor? = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    var shadowOpacity: Float = 0
    var shadowOffset: CGSize = CGSize(width: 0, height: -3)
    var shadowRadius: Double = 3
    
    func assert(actual: UIView?)
    {
        XCTAssertNotNil(actual, "Nil view")
        if let view = actual {
            XCTAssertEqual(view.cornerRadius, cornerRadius, "Incorrect corner radius")
            XCTAssertEqual(view.borderWidth, borderWidth, "Incorrect border width")
            if let color = borderColor {
                XCTAssertEqual(view.borderColor!, color, "Incorrect border color")
            } else {
                XCTAssertNil(view.borderColor, "Border color should not be set")
            }
            if let color = shadowColor {
                XCTAssertEqual(view.shadowColor!, color, "Incorrect shadow color")
            } else {
                XCTAssertNil(view.shadowColor, "Shadow color should not be set")
            }
            XCTAssertEqual(view.shadowOpacity, shadowOpacity, "Incorrect shadow opacity")
            XCTAssertEqual(view.shadowOffset, shadowOffset, "Incorrect shadow offset")
            XCTAssertEqual(view.shadowRadius, shadowRadius, "Incorrect shadow radius")
        }
    }
}

class IBInspectables_FromStoryboardTests: XCTestCase {
    
    var viewController: ViewController! {
        return UIApplication.sharedApplication().delegate?.window!?.rootViewController! as? ViewController
    }
    
    func testNone() {
        TestComparison().assert(viewController.noneView)
    }
    
    func testCornerRadius() {
        var test = TestComparison()
        test.cornerRadius = 10
        test.assert(viewController.cornerRadiusView)
    }
    
    func testBorderWidth() {
        var test = TestComparison()
        test.borderWidth = 20
        test.assert(viewController.borderWidthView)
    }
    
    func testBorderColor() {
        var test = TestComparison()
        test.borderColor = UIColor.redColor()
        test.assert(viewController.borderColorView)
    }
    
    func testShadowColor() {
        var test = TestComparison()
        test.shadowColor = UIColor.greenColor()
        test.assert(viewController.shadowColorView)
    }
    
    func testShadowOpacity() {
        var test = TestComparison()
        test.shadowOpacity = 0.5
        test.assert(viewController.shadowOpacityView)
    }
    
    func testShadowOffset() {
        var test = TestComparison()
        test.shadowOffset = CGSize(width: 100, height: 0)
        test.assert(viewController.shadowOffsetView)
    }
    
    func testShadowRadius() {
        var test = TestComparison()
        test.shadowRadius = 30
        test.assert(viewController.shadowRadiusView)
    }
    
    func testAll() {
        var test = TestComparison()
        test.cornerRadius = 5
        test.borderWidth = 10
        test.borderColor = UIColor.blueColor()
        test.shadowColor = UIColor.cyanColor()
        test.shadowOpacity = 0.75
        test.shadowOffset = CGSize(width: 20, height: 25)
        test.shadowRadius = 30
        test.assert(viewController.allView)
    }
}

class IBInspectables_PropertyTests: XCTestCase {

    var view: UIView?
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
    }
    
    func testCornerRadius() {
        view?.cornerRadius = 40
        var test = TestComparison()
        test.cornerRadius = 40
        test.assert(view)
    }
    
    func testBorderWidth() {
        view?.borderWidth = 400
        var test = TestComparison()
        test.borderWidth = 400
        test.assert(view)
    }
    
    func testBorderColor() {
        view?.borderColor = UIColor.orangeColor()
        var test = TestComparison()
        test.borderColor = UIColor.orangeColor()
        test.assert(view)
        
        view?.borderColor = nil
        test = TestComparison()
        test.borderColor = nil
        test.assert(view)
    }
    
    func testShadowColor() {
        view?.shadowColor = UIColor.purpleColor()
        var test = TestComparison()
        test.shadowColor = UIColor.purpleColor()
        test.assert(view)
        
        view?.shadowColor = nil
        test = TestComparison()
        test.shadowColor = nil
        test.assert(view)
    }
    
    func testShadowOpacity() {
        view?.shadowOpacity = 0.05
        var test = TestComparison()
        test.shadowOpacity = 0.05
        test.assert(view)
    }
    
    func testShadowOffset() {
        view?.shadowOffset = CGSize(width: 100, height: 100)
        var test = TestComparison()
        test.shadowOffset = CGSize(width: 100, height: 100)
        test.assert(view)
    }
    
    func testShadowRadius() {
        view?.shadowRadius = 30
        var test = TestComparison()
        test.shadowRadius = 30
        test.assert(view)
    }
}

