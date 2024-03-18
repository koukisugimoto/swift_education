//
//  Problem.swift
//  Quiz
//
//  Created by 椙本洸希 on 2022/11/19.
//

import UIKit

class Problem: NSObject {
    var question = String()
    var answer = Int()
    
    func setQ(q: String,a: Int) {
        question = q
        answer = a
    }
    
    func getQ() -> String {
        return question
    }
    
    func getA() -> Int {
        return answer
    }

}

