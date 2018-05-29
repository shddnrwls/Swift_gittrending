//
//  ParsingViewModel.swift
//  GitTrending
//
//  Created by mac on 2018. 5. 28..
//  Copyright © 2018년 swift. All rights reserved.
//
import RxCocoa
import RxAlamofire
import RxSwift
import Kanna
import Alamofire

class ParsingViewModel{
    func allTrending(){
        let doc:HTMLDocument = ParsingProtocool.all().getParsing() as! HTMLDocument
        for product in doc.xpath("//div[@class='explore-content']") {
            if let olTag = product.at_xpath("ol"){
                print(olTag.content)
            
            }
            
        }
    }
}
