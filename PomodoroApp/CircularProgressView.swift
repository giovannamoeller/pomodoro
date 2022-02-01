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
  
  private var timeText: UILabel?
  private var startStopButton: UIButton?
  
  private var timer: Timer = Timer()
  private var duration: TimeInterval = 0
  private var runCount = 0
  
  private var circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
  
  init(frame: CGRect, timeText: UILabel, startStopButton: UIButton) {
    super.init(frame: frame)
    self.timeText = timeText
    self.startStopButton = startStopButton
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
    timer.invalidate()
    self.duration = duration
    setText()
  }
  
  func stopTimer() {
    timer.invalidate()
    progressLayer.removeAnimation(forKey: "progressAnim")
  }
  
  func resumeTimer() {
    initTimer(isRepeating: true)
  }
  
  func pauseTimer() {
    timer.invalidate()
    pauseProgress()
  }
  
  func initTimer(isRepeating: Bool = false) {
    if !isRepeating {
      runCount = 0
      progressAnimation()
    }
    resumeProgress()
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      self.runCount += 1
      self.timeText?.text = String().formatToMinute(from: (self.duration * 60) - Double(self.runCount))
      if self.runCount == Int(self.duration * 60) {
        self.stopTimer()
        self.progressLayer.removeAnimation(forKey: "progressAnim")
      }
    }
    timer.fire()
  }
  
  func setText() {
    timeText?.text = String().formatToMinute(from: duration * 60)
  }
  
  func progressAnimation() {
    circularProgressAnimation.duration = duration * 60
    circularProgressAnimation.toValue = 1.0
    circularProgressAnimation.speed = 1.0
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    circularProgressAnimation.timeOffset = 0.0
    progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
  }
  
  func pauseProgress() {
    let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
    layer.speed = 0.0
    layer.timeOffset = pausedTime
  }
  
  func resumeProgress() {
    let pausedTime = layer.timeOffset
    layer.speed = 1.0
    layer.timeOffset = 0.0
    layer.beginTime = 0.0
    let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
    layer.beginTime = timeSincePause
  }
}
