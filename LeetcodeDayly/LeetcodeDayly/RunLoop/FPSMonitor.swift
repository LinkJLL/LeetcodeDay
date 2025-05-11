//
//  FPSMonitor.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/11.
//

import UIKit

class FPSMonitor: NSObject {

    static let share : FPSMonitor = .init()
    
    private var activity : CFRunLoopActivity?
    
    private var runLoopObserver : CFRunLoopObserver?
    
    
    private var semaphore : DispatchSemaphore = .init(value: 0)
    
    //设置阈值
    private let threshold : TimeInterval = 0.03
    private var lastTime : TimeInterval = 0
    
    //记录次数
    private var timeoutCount : Int = 0
    
    
    func startMonitoring(){
     
        //创建一个 CFRunLoopObserver 观察者
       let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0) {[weak self] observer, activity in
           self?.activity = activity
           self?.semaphore.signal()
        }
        
        self.runLoopObserver = observer
        
        CFRunLoopAddObserver(CFRunLoopGetMain(), observer, .commonModes)
        
        DispatchQueue.global().async {
            self.monitor()
        }
    }
    
    func monitor(){
        while true {
            let timeout = semaphore.wait(timeout: .now() + self.threshold)
            if timeout == .timedOut {
                //如果 状态 在 beforeWaiting 时间内 未 变换 说明 产生了卡顿
                if self.activity == .beforeSources ||
                    self.activity == .afterWaiting {
                    self.timeoutCount += 1
                    let currentTime = CACurrentMediaTime()
                    let lagTime = currentTime - self.lastTime
                    DispatchQueue.main.async { [weak self] in
//                        self?.lagCallback?(lagTime)
                        debugPrint("卡顿了")
                        debugPrint(Thread.callStackSymbols)
                    }
                }
            }else{
                self.timeoutCount = 0
            }
        }
    }
    
    
    func stackInfo(){
        var list : thread_act_array_t
        var count : mach_msg_type_number_t
//        task_threads(mach_task_is_self(""), &list, &count)
    }
    
}
