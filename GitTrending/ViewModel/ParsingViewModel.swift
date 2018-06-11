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
enum ParsingStatus {
    case success
    case fail
}


class ParsingViewModel{
    var alertObserver:PublishSubject<String> = PublishSubject<String>()
    var statusObserver:PublishSubject<ParsingStatus> = PublishSubject<ParsingStatus>()
    func allTrending() {
        let model = ParsingManager.instance.allTrending()

    }
}
