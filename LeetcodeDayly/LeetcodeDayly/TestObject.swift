//
//  TestObject.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/06/02.
//

import UIKit

class TestObject: NSObject {

    public func sayHi(){
        
        var a = AModel(name: "1")
        withUnsafePointer(to:  &a) { ptr in
            print("地址1是: \(ptr)")
        }
        a.changeName("2")
        var b = a
        b.changeName("3")
        withUnsafePointer(to:  &b) { ptr in
            print("地址2是: \(ptr)")
        }
    }
    
     static func doSomeMethod(){
         print("这是static方法")
     }
     
     class func doSomeClassMehtod(){
         print("这是class方法")
     }
      
      fileprivate func testFilePrivate(){
          
      }
      func testNormalMethod(){
          
      }
      private func testPrivateMethod(){
          print("testFatherPrivateMethod")
      }
      final func testFinalMethod(){
          print("testFatherPrivateMethod")
      }
}


final class Son: TestObject {
    
    override class func doSomeClassMehtod() {
        super.doSomeClassMehtod()
        self.doSomeMethod()
    }
    override func testNormalMethod() {
        
    }
    
    override func testFilePrivate() {
        
    }
    func testPrivateMethod(){
        print("testPrivateMethod")
    }
   
}



struct AModel {
    var name : String;
    mutating func changeName(_ value : String){
        self.name = value
    }
}


class A: NSObject {
    private func privateMehtod(){
        print("这是A的PrivateMehtod")
    }
}
class B: A {
     func privateMehtod(){
        print("这是B的PrivateMehtod")
    }
}
