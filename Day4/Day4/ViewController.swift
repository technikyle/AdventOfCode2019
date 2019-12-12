//
//  ViewController.swift
//  Day4
//
//  Created by Kyle Rokita on 12/4/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let start = 111122
//        let end = 111122


        let start = 382345
        let end = 843167


        func test(i: Int) -> Bool {
            var prefix = i
            var digits : [Int] = []

            while prefix > 0 {
                let lastDigit = ((Double(prefix) / 10.0  - (Double(prefix) / 10.0).rounded(.down)) * 10.0).rounded()
                digits.append(Int(lastDigit))
                prefix = Int(Double(prefix) / 10.0)
            }
            let ordered = Array(digits.reversed())

            func validConsec(index: Int) -> Bool {
                var result = true

                if index < digits.count - 1 {
                    result = result && digits[index] == digits[index+1]
                }

                if index < digits.count - 2 {
                    result = result && digits[index] != digits[index+2]
                }

                if index > 0 {
                    result = result && digits[index] != digits[index-1]
                }

                if index == digits.count - 1 {
                    result = false
                }

                return result
            }

            let passes2ConsecTest = ordered.enumerated().reduce(false) { result, tuple -> Bool in
                return result ||   validConsec(index: tuple.offset)
            }

            let passesAscendingTest = ordered.enumerated().reduce(true) { result, tuple -> Bool in
                return result && (tuple.offset == ordered.count - 1 || tuple.element <= ordered[tuple.offset+1])
            }

            return passes2ConsecTest && passesAscendingTest
        }

        let results = (start...end).filter { test(i:$0) }
        print(results.count)
    }


}

