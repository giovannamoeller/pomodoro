//
//  ViewController.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 28/01/22.
//

import UIKit

class ViewController: UIViewController {
  
  private var circleLayer = CAShapeLayer()
  private var progressLayer = CAShapeLayer()
  private var startPoint = CGFloat(-Double.pi / 2)
  private var endPoint = CGFloat(3 * Double.pi / 2)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addSubviews()
    configureUI()
    setUpConstraints()
    createCircularPath()
    //setUpCircularProgressBarView()
  }
  
  func addSubviews() {
    
  }
  
  func configureUI() {
    view.backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  func setUpConstraints() {
    
  }
  
  func createCircularPath() {
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: view.frame.size.width / 2.0, y: view.frame.size.height / 2.0), radius: 80, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    // circleLayer path defined to circularPath
    circleLayer.path = circularPath.cgPath
    // ui edits
    circleLayer.fillColor = UIColor.clear.cgColor
    circleLayer.lineCap = .round
    circleLayer.lineWidth = 10.0
    circleLayer.strokeEnd = 1.0
    circleLayer.strokeColor = UIColor.white.cgColor
    // added circleLayer to layer
    view.layer.addSublayer(circleLayer)
    // progressLayer path defined to circularPath
    progressLayer.path = circularPath.cgPath
    // ui edits
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.lineCap = .round
    progressLayer.lineWidth = 10.0
    progressLayer.strokeEnd = 0
    progressLayer.strokeColor = UIColor.systemIndigo.cgColor
    
    view.layer.addSublayer(progressLayer)
    progressAnimation(duration: 2 * 60)
  }
  
  func progressAnimation(duration: TimeInterval) {
    // created circularProgressAnimation with keyPath
    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    // set the end time
    circularProgressAnimation.duration = duration
    circularProgressAnimation.toValue = 1.0
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
  
}

