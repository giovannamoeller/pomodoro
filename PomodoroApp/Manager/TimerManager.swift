//
//  TimerManager.swift
//  PomodoroApp
//
//  Created by Giovanna Moeller on 30/01/22.
//

import Foundation

protocol TimerManagerDelegate {
  func setText(duration: TimeInterval)
}

class TimerManager {
  
  var delegate: TimerManagerDelegate?
  
  var timer: Timer = Timer()
  var runCount = 0
  var duration: TimeInterval = 0
  var timeText: String = ""
  
  func getDuration(index: Int) -> TimeInterval {
    var duration: TimeInterval
    switch index {
      case 0: duration = Time.pomodoro.rawValue
      case 1: duration = Time.shortBreak.rawValue
      case 2: duration = Time.longBreak.rawValue
      default: fatalError("Index not found")
    }
    return duration
  }
  
  func setDuration(duration: TimeInterval) {
    timer.invalidate()
    self.duration = duration
    //setText()
  }
  
  func stopTimer() {
    timer.invalidate()
    //progressLayer.removeAnimation(forKey: "progressAnim")
  }
  
  func resumeTimer() {
    initTimer(isRepeating: true)
  }
  
  func pauseTimer() {
    timer.invalidate()
    //pauseProgress()
  }
  
  func initTimer(isRepeating: Bool = false) {
    if !isRepeating {
      runCount = 0
      //progressAnimation()
    }
    //resumeProgress()
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      self.runCount += 1
      self.delegate?.setText(duration: (self.duration * 60) - Double(self.runCount))
      if self.runCount == Int(self.duration * 60) {
        self.stopTimer()
      }
    }
    timer.fire()
  }
}
