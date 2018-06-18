//
//  ParsingManager.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 28..
//  Copyright © 2018년 swift. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire
import Kanna


protocol HtmlParsingProtocool {
    func all() -> Observable<Bool>
    func java() -> Observable<Bool>
    func swift() -> Observable<Bool>
}
class ParsingManager  {
    static let instance:ParsingManager = ParsingManager()
    
    private init(){}
    func allTrending(){
        var model = [ParsingModel]()
        var repository:String = ""
        var contents:String = ""
        DispatchQueue.global(qos:.background).async {
            let doc:HTMLDocument = ParsingProtocool.all().getParsing() as! HTMLDocument
            for product in doc.xpath("//div[@class='explore-content']") {
                if let olTag = product.at_xpath("ol"){
                    for list in olTag.xpath("li"){
                        if let divTag = list.at_xpath("div"){
                            if let name = divTag.text, name.contains("/"){
                                let parsingname = name.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                repository = parsingname
                            }
                        }
                        if let con = list.at_xpath("div[@class = 'py-1']"){
                            if let conn = con.at_xpath("p"){
                                let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                                contents = connn!
                            }
                        }
                        model.append(ParsingModel(repository: repository, content: contents))
                        
                        
                    }
                }
            
        }
    }
    
    func swiftTrending(){
    }
}
}
