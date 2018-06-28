//
//  ParsingManager.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 28..
//  Copyright © 2018년 swift. All rights reserved.
//

import Foundation
import Alamofire
import Kanna


protocol HtmlParsingProtocol {
    func all() -> Any
    func swift() -> Any
    func java() -> Any
}
class ParsingManager {
    static let instance:ParsingManager = ParsingManager()
    private init(){
        
    }
}

extension ParsingManager: HtmlParsingProtocol{
    
    
    func all() -> Any {
        var nameArr : Array<String> = Array<String>()
        var contentArr : Array<String> = Array<String>()
        var array : Array<Array<String>> = Array<Array<String>>()
        let doc:HTMLDocument = ParsingProtocool.all().getParsing() as! HTMLDocument
        for product in doc.xpath("//div[@class='explore-content']") {
            if let olTag = product.at_xpath("ol"){
                for list in olTag.xpath("li"){
                    if let divTag = list.at_xpath("div"){
                        if let name = divTag.text, name.contains("/"){
                            let parsingname = name.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            nameArr.append(parsingname)
                            
                        }
                    }
                    if let con = list.at_xpath("div[@class = 'py-1']"){
                        if let conn = con.at_xpath("p"){
                            let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            contentArr.append(connn!)
                        }
                    }
                }
                array.append(nameArr)
                array.append(contentArr)
                
            }
        }
        return array
    }//allTrending
    func swift() -> Any {
        var nameArr : Array<String> = Array<String>()
        var contentArr : Array<String> = Array<String>()
        var array : Array<Array<String>> = Array<Array<String>>()
        let doc:HTMLDocument = ParsingProtocool.swift().getParsing() as! HTMLDocument
        for product in doc.xpath("//div[@class='explore-content']") {
            if let olTag = product.at_xpath("ol"){
                for list in olTag.xpath("li"){
                    if let divTag = list.at_xpath("div"){
                        if let name = divTag.text, name.contains("/"){
                            let parsingname = name.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            nameArr.append(parsingname)
                            
                        }
                    }
                    if let con = list.at_xpath("div[@class = 'py-1']"){
                        if let conn = con.at_xpath("p"){
                            let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            contentArr.append(connn!)
                        }
                    }
                }
                array.append(nameArr)
                array.append(contentArr)
                
            }
        }
        return array
    }
    
    func java() -> Any {
        var nameArr : Array<String> = Array<String>()
        var contentArr : Array<String> = Array<String>()
        var array : Array<Array<String>> = Array<Array<String>>()
        let doc:HTMLDocument = ParsingProtocool.java().getParsing() as! HTMLDocument
        for product in doc.xpath("//div[@class='explore-content']") {
            if let olTag = product.at_xpath("ol"){
                for list in olTag.xpath("li"){
                    if let divTag = list.at_xpath("div"){
                        if let name = divTag.text, name.contains("/"){
                            let parsingname = name.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            nameArr.append(parsingname)
                            
                        }
                    }
                    if let con = list.at_xpath("div[@class = 'py-1']"){
                        if let conn = con.at_xpath("p"){
                            let connn = conn.text?.replacingOccurrences(of: "\n", with: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                            contentArr.append(connn!)
                        }
                    }
                }
                array.append(nameArr)
                array.append(contentArr)
                
            }
        }
        return array
    }
    
}
