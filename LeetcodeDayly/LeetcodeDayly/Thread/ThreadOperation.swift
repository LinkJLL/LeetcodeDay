//
//  ThreadOperation.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/12.
//

import UIKit

class TestThread: NSObject {
    
    var ticketSurplusCount : Int = 50
    var lock : NSLock = .init()
    static func createMainThread(){
        let  mainQueue = OperationQueue.main
        mainQueue.maxConcurrentOperationCount = 10
        let oper1 = BlockOperation.init {
            print("主队列任务1",Thread.current)
            sleep(2)
        }
        let oper2 = BlockOperation.init {
            print("主队列任务2",Thread.current)
            sleep(2)
        }
        mainQueue.addOperation(oper1)
        mainQueue.addOperation(oper2)
        
    }
    
     func customCreateQueue(){
        
        let customQueue = OperationQueue.init()
//        customQueue.maxConcurrentOperationCount = 2
        let oper1 = BlockOperation.init {
            self.saleTicketNotSafe()
            sleep(2)
        }
      
        let oper2 = BlockOperation.init {
            self.saleTicketNotSafe()
            sleep(2)
        }
        let oper3 = BlockOperation.init {
            self.saleTicketNotSafe()
            sleep(2)
        }
      
        let oper4 = BlockOperation.init {
            self.saleTicketNotSafe()
            sleep(2)
        }
        customQueue.addOperation {
            self.saleTicketNotSafe()
            sleep(2)
        }
        let oper5 = ThreadOperation.init()
         
        oper1.queuePriority = .veryLow
        oper2.queuePriority = .veryHigh
        oper3.queuePriority = .normal
        oper4.queuePriority = .high
        customQueue.addOperation(oper1)
        customQueue.addOperation(oper2)
        customQueue.addOperation(oper3)
        customQueue.addOperation(oper4)
        customQueue.addOperation(oper5)
    }
    
    
    @objc func task1(){
        
    }
    @objc func task2(){
        
    }
    
    func saleTicketNotSafe(){
        while true {
            self.lock.lock()
            if (self.ticketSurplusCount > 0){
                self.ticketSurplusCount -= 1;
                print("当前票数：",self.ticketSurplusCount)
            }
            self.lock.unlock()
            if self.ticketSurplusCount <= 0{
                    print("已售完：",self.ticketSurplusCount)
                    break
            }
        }
    }
    func  semaphore(){
        //最多有10个线程并发
        let semaphore = DispatchSemaphore.init(value: 5)
//        DispatchSemaphore
        for i in 0..<20 {
            DispatchQueue.global().async {
                print("当前执行 \(i)")
                semaphore.signal()
            }
            semaphore.wait()
        }
        print("执行完成")
    }
    
}

class ThreadOperation: Operation, @unchecked Sendable {
    var room : ChatRoom?
    override func main() {
        print("任务开始",Thread.current)
      
    }
    
   
}
actor ChatRoom {
    var messages: [String] = []
    
    func add(message: String) {
        messages.append(message)
    }
    
    func getMessages() -> [String] {
        return messages
    }
}

