//
//  ViewController.swift
//  Day12
//
//  Created by Kyle Rokita on 12/15/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    typealias Vector = [Int]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = """
                    <x=-3, y=15, z=-11>
                    <x=3, y=13, z=-19>
                    <x=-13, y=18, z=-2>
                    <x=6, y=0, z=-1>
                    """
        
        var positions = cleanInput(input: input)
        var velocities: [Vector] = positions.map { _ in [0,0,0] }
        
        var combinations = self.combinations(input: (0..<positions.count).map { $0 })
        
        (0..<positions.count).forEach { i in
            print("\(positions[i]), \(velocities[i])")
        }
        
        var matchesPriorState = false
        
        func hash(vectors: [[Vector]], axis: Int) -> String {
            return vectors.map { $0.map { String($0[axis]) }.joined(separator: ", ") }.joined(separator: ",")
        }

        var positionSets: [Set<String>] = [Set<String>].init(repeating: Set<String>(), count: 3)
        
        func addToHashList(vectors: [[Vector]]) {
            for axis in (0...2) {
                positionSets[axis].insert(hash(vectors: vectors, axis: axis))
            }
        }
        
        func containsHash(vectors: [[Vector]]) -> [Bool] {
           return (0...2).map({ axis -> Bool in
                if positionSets[axis].contains(hash(vectors: vectors, axis: axis)) {
                    return true
                }
                return false
            })
        }
        
        addToHashList(vectors: [positions, velocities])
        
        var stepsForLoop: [Int] = [Int].init(repeating: 0, count: 3)
        
        
        var step = 1
        while stepsForLoop.contains(0) {

            for combination in combinations {
                let moonIndex1 = combination[0]
                let moonIndex2 = combination[1]
                
//                var gravityVector1 = [0,0,0]
//                var gravityVector2 = [0,0,0]

                for i in (0...2) {
                    let direction = positions[moonIndex1][i] - positions[moonIndex2][i]
                    var gravity: Int = 0
                    if direction < 0 {
                        gravity = -1
                    } else if direction > 0 {
                        gravity = 1
                    }
//                    gravityVector1[i] = gravity
//                    gravityVector2[i] = -gravity
                    
                    velocities[moonIndex1][i] = velocities[moonIndex1][i] - gravity
                    velocities[moonIndex2][i] = velocities[moonIndex2][i] + gravity
                }
            }
            
            (0..<positions.count).forEach { moonIndex in
                for i in (0...2) {
                    positions[moonIndex][i] = positions[moonIndex][i] + velocities[moonIndex][i]
                }
//                print("\(positions[moonIndex]), \(velocities[moonIndex])")
            }
            
            let matchAxis = containsHash(vectors: [positions, velocities])
            for (index, result) in matchAxis.enumerated() {
                if stepsForLoop[index] == 0 && result == true {
                    stepsForLoop[index] = step
                }

            }
            
            addToHashList(vectors: [positions, velocities])

            step += 1
        }
        
        print(stepsForLoop)
        let result = lcm(numbers: stepsForLoop)
        print(result)

//
//        var potentials = [Int].init(repeating: positions.count, count: 0)
//        var kinetics = [Int].init(repeating: positions.count, count: 0)
//
//        var overallTotal = 0
//        for i in (0..<positions.count) {
//
//            func totalEnergy(vector:Vector) -> Int {
//                return vector.reduce(0) { result, element -> Int in
//                    return result + abs(element)
//                }
//            }
//
//
//            let potential = totalEnergy(vector: positions[i])
//            let kinetic = totalEnergy(vector: velocities[i])
//            let total = potential * kinetic
//
//            print("pot: \(potential), kin: \(kinetic), total: \(total)")
//            overallTotal += total
//        }
//        print("overallTotal: \(overallTotal)")

    }
    
    func lcm(numbers:[Int]) -> Int {
        
        func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }
            return gcd(b, a % b)
        }
        
        var result = numbers[0]
        
        for i in (1..<numbers.count) {
            result = (((numbers[i] * result)) / (gcd(numbers[i], result)))
        }
        
        return result
    }
    
//    // Utility function to find
//    // GCD of 'a' and 'b'
//    int gcd(int a, int b)
//    {
//        if (b == 0)
//        return a;
//        return gcd(b, a % b);
//    }
//
//    // Returns LCM of array elements
//    ll findlcm(int arr[], int n)
//    {
//        // Initialize result
//        ll ans = arr[0];
//
//        // ans contains LCM of arr[0], ..arr[i]
//        // after i'th iteration,
//        for (int i = 1; i < n; i++)
//        ans = (((arr[i] * ans)) /
//        (gcd(arr[i], ans)));
//
//        return ans;
//    }
//
    func combinations(input:[Int]) -> [[Int]] {
        var result = [[Int]]()
        var i = 0
        while i < input.count {
            var j = i + 1
            while j < input.count {
                result.append([input[i], input[j]])
                j += 1
            }
            i += 1
        }
        return result
    }
    
    func cleanInput(input: String) -> [Vector] {
        let cleanString = input.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        var results = [Vector]()
        for cleanString in cleanString.split(separator: "\n") {
            let tupleStrings = String(cleanString).split(separator: ",")
            var dict = [String: Int]()
            for tupleString in tupleStrings {
                let pair = String(tupleString).split(separator: "=").map { String($0) }
                dict[pair[0]] = Int(pair[1])!
            }
            let vector: Vector = [dict["x"]!, dict["y"]!, dict["z"]!]
            results.append(vector)
        }
        return results
    }
    
    func permuteWirth<T>(_ a: [T], _ n: Int, results: inout [[T]]) {
        if n == 0 {
            results.append(a)   // display the current permutation
        } else {
            var a = a
            permuteWirth(a, n - 1, results: &results)
            for i in 0..<n {
                a.swapAt(i, n)
                permuteWirth(a, n - 1, results: &results)
                a.swapAt(i, n)
            }
        }
    }

}

