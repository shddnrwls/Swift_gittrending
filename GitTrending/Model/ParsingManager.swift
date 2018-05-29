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
}
class ParsingManager {
    static let instance:ParsingManager = ParsingManager()
    private init(){}
}
