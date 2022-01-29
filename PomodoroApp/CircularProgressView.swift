//
//  CircularProgressView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 29/01/22.
//

import UIKit

class CircularProgressView: UIView {
  
  private var bigCircleLayer = CAShapeLayer()
  private var circleLayer = CAShapeLayer()
  private var progressLayer = CAShapeLayer()
  private var startPoint = CGFloat(-Double.pi / 2)
  private var endPoint = CGFloat(3 * Double.pi / 2)
  private lazy var timer: Timer = Timer()
  
  private lazy var timeText: UILabel = {
    let text = UILabel()
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textColor = .white
    text.font = .systemFont(ofSize: 48.0, weight: .heavy)
    return text
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    createCircularPath()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createCircularPath() {
    
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: 130, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    
    circleLayer.path = circularPath.cgPath
    circleLayer.fillColor = UIColor(named: "DarkBackgroundColor")?.cgColor
    circleLayer.lineCap = .round
    circleLayer.strokeEnd = 1.0
    circleLayer.strokeColor = UIColor.clear.cgColor
    
    layer.addSublayer(circleLayer)
    addSubview(timeText)
    setUpConstraints()
    
    let pathProgressLayer = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: 110, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    progressLayer.path = pathProgressLayer.cgPath
    progressLayer.fillColor = UIColor.clear.cgColor
    progressLayer.lineCap = .round
    progressLayer.lineWidth = 10.0
    progressLayer.strokeEnd = 0
    progressLayer.strokeColor = UIColor(named: "Color1")?.cgColor
    
    layer.addSublayer(progressLayer)
  }
  
  func setDuration(duration: TimeInterval) {
    print(duration)
    progressAnimation(duration: duration)
  }
  
  func progressAnimation(duration: TimeInterval) {
    
    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    circularProgressAnimation.duration = duration * 60
    circularProgressAnimation.toValue = 1.0
        
    let interval = duration
    
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .full
    
    let formattedString = formatter.string(from: interval)!
  
    timer.invalidate()
    
    timeText.text = String(duration)
    
    let durationInSeconds = duration * 60
    initTimer(duration: durationInSeconds)
    
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
  
  func initTimer(duration: TimeInterval) {
    var runCount = 0
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      runCount += 1
      self.timeText.text = String(duration - Double(runCount))
      if runCount == Int(duration) {
        timer.invalidate()
      }
    }
    timer.fire()
  }
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      timeText.centerYAnchor.constraint(equalTo: centerYAnchor),
      timeText.centerXAnchor.constraint(equalTo: centerXAnchor),
    ])
  }
  
}
