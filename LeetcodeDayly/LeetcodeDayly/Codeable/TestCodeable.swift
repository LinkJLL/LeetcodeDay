//
//  TestCodeable.swift
//  LeetcodeDayly
//
//  Created by JL L on 2025/06/03.
//

import UIKit

class TestCodeable: NSObject {

    //可选值的解码所表达的是“如果不存在，则置为nil”
    func jsonParase(){
        let json = "{\"id\": 12345, \"title\": \"My First Video\",\"commentEnabled\": true,\"state\": \"archived\"}"
        if let jsonData = json.data(using: .utf8){
            let model = try? JSONDecoder().decode(Video.self, from: jsonData)
            print(model ?? "")
        }
        

    }
}

struct Video : Decodable {
    let id : Int
    let title : String
    
    @Default<Bool> var commentEnabled: Bool
    
    enum State : String,Decodable {
        case streaming
        case archived
    }
    let state : State
}


@propertyWrapper
struct Default<T: DefaultValue> {
    let wrappedValue : T.Value
}
extension Default : Decodable{
    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}
protocol DefaultValue {
    associatedtype Value : Decodable
    static var defaultValue: Value { get }
}
extension Bool : DefaultValue{
    static let defaultValue = false
    
}

extension KeyedDecodingContainer{
    func decode<T>(_ type: Default<T>.Type,forKey key: Key) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}
