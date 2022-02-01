//
//  CircularProgressView.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 29/01/22.
//

import UIKit

class CircularProgressView: UIView {
  
  private var backgroundCircleLayer = CAShapeLayer()
  private var timeProgressLayer = CAShapeLayer()
  private var startPoint = CGFloat(-Double.pi / 2)
  private var endPoint = CGFloat(3 * Double.pi / 2)
  
  private var timeText = TimeTextView()
  private var startStopButton: UIButton?
  
  private var timerManager: TimerManager?
  
  private var circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubviews()
    setUpConstraints()
    createBackgroundCircleLayer()
    createTimeProgressLayer()
    bringSubviewToFront(timeText)
  }
  
  func addSubviews() {
    addSubview(ovalImageView)
    addSubview(timeText)
    timeText.text = "25:00"
  }
  
  /*func updateView(timeText: UILabel, startStopButton: UIButton, timerManager: TimerManager) {
    self.timeText = timeText
    self.startStopButton = startStopButton
    self.timerManager = timerManager
  }*/
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func createBackgroundCircleLayer() {
    let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: 130, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    backgroundCircleLayer.path = circularPath.cgPath
    backgroundCircleLayer.fillColor = UIColor(named: "DarkBackgroundColor")?.cgColor
    backgroundCircleLayer.lineCap = .round
    backgroundCircleLayer.strokeEnd = 1.0
    backgroundCircleLayer.strokeColor = UIColor.clear.cgColor
    layer.addSublayer(backgroundCircleLayer)
  }
  
  func createTimeProgressLayer() {
    let progressPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width, y: frame.size.height), radius: 110, startAngle: startPoint, endAngle: endPoint, clockwise: true)
    timeProgressLayer.path = progressPath.cgPath
    timeProgressLayer.fillColor = UIColor.clear.cgColor
    timeProgressLayer.lineCap = .round
    timeProgressLayer.lineWidth = 10.0
    timeProgressLayer.strokeEnd = 0
    timeProgressLayer.strokeColor = UIColor(named: "Color1")?.cgColor
    layer.addSublayer(timeProgressLayer)
  }

  private lazy var ovalImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "oval"))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.shadowColor = UIColor(named: "ShadowColor")?.cgColor
    imageView.layer.shadowOpacity = 1
    imageView.layer.shadowOffset = .init(width: -20, height: -20)
    imageView.layer.shadowRadius = 40
    return imageView
  }()
  
  func setUpConstraints() {
    NSLayoutConstraint.activate([
      ovalImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
      ovalImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      
      timeText.centerXAnchor.constraint(equalTo: centerXAnchor),
      timeText.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
  
  /*func setDuration(duration: TimeInterval) {
    timer.invalidate()
    self.duration = duration
    setText()
  }
  
  func stopTimer() {
    timer.invalidate()
    timeProgressLayer.removeAnimation(forKey: "progressAnim")
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
        self.timeProgressLayer.removeAnimation(forKey: "progressAnim")
      }
    }
    timer.fire()
  }*/
  
  func setText() {
    timeText.text = String().formatToMinute(from: timerManager?.duration ?? 0 * 60)
  }
  
  func progressAnimation() {
    circularProgressAnimation.duration = timerManager?.duration ?? 0 * 60
    circularProgressAnimation.toValue = 1.0
    circularProgressAnimation.speed = 1.0
    circularProgressAnimation.fillMode = .forwards
    circularProgressAnimation.isRemovedOnCompletion = false
    circularProgressAnimation.timeOffset = 0.0
    timeProgressLayer.add(circularProgressAnimation, forKey: "progressAnim")
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
