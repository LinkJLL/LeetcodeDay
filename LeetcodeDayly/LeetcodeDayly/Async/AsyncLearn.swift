//
//  AsyncLearn.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/05/19.
//

import UIKit
protocol AsyncLearnDelegate:NSObjectProtocol {
    var name : String{get}
    func test()
}

extension AsyncLearnDelegate{
    func test(){}
    var name : String{
        return ""
    }
}

protocol Atestprotocol {
    var name : String{get}
}

extension Atestprotocol{
    
}

class AsyncLearn: NSObject , AsyncLearnDelegate ,Atestprotocol{
    
    var delegate : AsyncLearnDelegate?
    func useAsync(){
        Task{
//            async let name =  self.aaaa()
//            async let b =  self.nbbbb()
//            let result = await (name, b)
//            print("\(result)")
            let name = await self.fetchNames()
            print(name)
        }
        
       
        
    }
    
    func helloAsyncThrows() async  -> String{
        await withCheckedContinuation { contiuation in
            DispatchQueue.main.async {
                contiuation.resume(returning: "a哈哈哈哈")
            }
        }
        
    }
   
    
    func updateDataBase(with articles : [String]) async -> Array<Any>{
       await withCheckedContinuation { contiuation in
           contiuation.resume(with: Result<[Any], Never>.success([1]))
        }
    }
    
    func fetchNames() async -> [String] {
        let ids = [1, 2, 3, 4]
        
        return await withTaskGroup(of: String.self) { group in
            for id in ids {
                group.addTask {
                    return await self.fetchName(id: id)
                }
            }
            
            var results = [String]()
            
            for await name in group {
                results.append(name)
            }
            
            return results
        }
    }
    
    func fetchName(id: Int) async -> String {
        return "User \(id)"
    }

    func aaaa() async -> String{
        await withCheckedContinuation { continuation in
            continuation.resume(returning: "value");
        }
    }
    
    func nbbbb() async -> String{
        let a = await aaaa()
        return a
    }
    

    
}
