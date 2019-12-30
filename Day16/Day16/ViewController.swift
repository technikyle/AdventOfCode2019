//
//  ViewController.swift
//  Day16
//
//  Created by Kyle Rokita on 12/21/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = ViewController.input.map { Int(String($0))! }
        
        var result = (0..<10_000).flatMap { _ in input }

//        derivePatterns(input: result)
        
        func valueAt(list: [Int], index: Int, length: Int) -> Int {
            return Int(list[index..<(index + length)].map({ String($0) }).joined())!
        }
        let offset = valueAt(list: input, index: 0, length: 7)
        
        for phase in (0..<100) {
            print("starting phase \(phase)")
            result = runPhase(input: result)
        }
        
        let finalResult = valueAt(list: result, index: offset, length: 8)
        
        print(finalResult)
    }
    
    let basePattern = [0, 1, 0, -1]

    var phase = 1
    
    static let input = "03036732577212944063491565474664"
    
    var patterns: [[Int]] = []
    
    func derivePatterns(input:[Int]) {
        let inputLength = input.count
        for index in (1...inputLength) {
            
            var pattern = [Int]()
            for inputIndex in (0..<input.count) {
                let basePatternIndex = deriveBasePatternIndex(inputIndex: inputIndex, index: index)
                pattern.append(basePattern[basePatternIndex])
            }
            
            patterns.append(pattern)
        }
    }
     
    func deriveBasePatternIndex(inputIndex:Int, index:Int) -> Int {
       return ((inputIndex + 1) / index) % basePattern.count
    }

    func runPhase(input:[Int]) -> [Int] {
        var result = [Int].init(repeating: 0, count: input.count)
        for i in (0..<input.count) {
            var thisResult = 0
            for j in (0..<input.count) {
                let basePatternIndex = deriveBasePatternIndex(inputIndex: j, index: i + 1)
                let patternValue = basePattern[basePatternIndex]
                thisResult += input[j] * patternValue
            }
//            for patternIndex in (0..<patterns[i].count) {
//            }
            let thisResultOnesPlace = Int("\(thisResult)".suffix(1))!
            result[i] = thisResultOnesPlace
        }
        return result
    }
}

