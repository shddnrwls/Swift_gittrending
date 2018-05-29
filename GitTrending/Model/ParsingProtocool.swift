//
//  ParsingProtocool.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 28..
//  Copyright © 2018년 swift. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

enum ParsingProtocool{
    case all()
    case swift()
    
}
extension ParsingProtocool{
    private static let parsingUrl:String = "https://github.com"
    
    func getParsing() -> Any{
        guard let main = URL(string: self.url) else{
             print("Error: \(self.url) doesn't seem to be a valid URL")
            return false
        }
        do{
            let lolMain = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: lolMain, encoding: .utf8)
            return doc
        }
        catch let error {
            print(error)
            return false
        }
    }
    private var baseUrl:String{
        switch self {
        case .all(),.swift():
            return ParsingProtocool.parsingUrl
        }
    }
    private var url:String {
        switch self {
        case .all():
            return self.baseUrl+"/trending"
        case .swift():
            return self.baseUrl+"/trending/swift"
        }
    }
}
