//
//  ParsingModel.swift
//  GitTrending
//
//  Created by mac on 2018. 6. 8..
//  Copyright © 2018년 swift. All rights reserved.
//

class ParsingModel {
    var repositoryName:String
    var contents:String
    
    init(repository:String,content:String) {
        self.repositoryName = repository
        self.contents = content
    }
}
