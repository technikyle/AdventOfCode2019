//
//  ViewController.swift
//  Day10
//
//  Created by Kyle Rokita on 12/10/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = """
                    .#..#..##.#...###.#............#.
                    .....#..........##..#..#####.#..#
                    #....#...#..#.......#...........#
                    .#....#....#....#.#...#.#.#.#....
                    ..#..#.....#.......###.#.#.##....
                    ...#.##.###..#....#........#..#.#
                    ..#.##..#.#.#...##..........#...#
                    ..#..#.......................#..#
                    ...#..#.#...##.#...#.#..#.#......
                    ......#......#.....#.............
                    .###..#.#..#...#..#.#.......##..#
                    .#...#.................###......#
                    #.#.......#..####.#..##.###.....#
                    .#.#..#.#...##.#.#..#..##.#.#.#..
                    ##...#....#...#....##....#.#....#
                    ......#..#......#.#.....##..#.#..
                    ##.###.....#.#.###.#..#..#..###..
                    #...........#.#..#..#..#....#....
                    ..........#.#.#..#.###...#.....#.
                    ...#.###........##..#..##........
                    .###.....#.#.###...##.........#..
                    #.#...##.....#.#.........#..#.###
                    ..##..##........#........#......#
                    ..####......#...#..........#.#...
                    ......##...##.#........#...##.##.
                    .#..###...#.......#........#....#
                    ...##...#..#...#..#..#.#.#...#...
                    ....#......#.#............##.....
                    #......####...#.....#...#......#.
                    ...#............#...#..#.#.#..#.#
                    .#...#....###.####....#.#........
                    #.#...##...#.##...#....#.#..##.#.
                    .#....#.###..#..##.#.##...#.#..##
                    """
        
//        
//        let input = """
//.#..##.###...#######
//##.############..##.
//.#.######.########.#
//.###.#######.####.#.
//#####.##.#.##.###.##
//..#####..#.#########
//####################
//#.####....###.#.#.##
//##.#################
//#####.##.###..####..
//..######..##.#######
//####.##.####...##..#
//.#####..#.######.###
//##...#.##########...
//#.##########.#######
//.####.#.###.###.#.##
//....##.##.###..#####
//.#.#.###########.###
//#.#.#.#####.####.###
//###.##.####.##.#..##
//"""
        
        var bestPostion: (Int, Int, Int) = (0, 0, Int.min)
        
        enumeratedd(input: input) { x, y, element in
            guard element == "#" else { return }
            let asteroidCount = asteroidsInSite(input: input, startX: x, startY: y)
            if asteroidCount > bestPostion.2 {
                bestPostion = (x, y, asteroidCount)
            }
        }

        print(bestPostion)
        
//        let asteroidCount = asteroidsInSite(input: input, startX: 3, startY: 4)
//        print(asteroidCount)
        
        
        // part 2
        // store angle with tuple instead of yDiff / xDiff
        // create array of all entires sorted by level, then angle
        let angle = atan2(-1.0, 0.0) + Double.pi / 2.0
        print(angle)
        
        let asteroids = self.asteroids(input: input, startX: bestPostion.0, startY: bestPostion.1)
        
        var angleMap = [String:[(Int, Int, Int, Double, String)]]()
        for asteroid in asteroids {
            let hash = String(asteroid.3)
            var list = angleMap[hash] ?? []
            list.append(asteroid)
            var sortedList = list.sorted { element1, element2 -> Bool in
                return element1.2 < element2.2
            }
            angleMap[hash] = sortedList
        }
        
        var angles = [[(Int, Int, Int, Double, String)]]()
        for angleMapItem in angleMap {
            angles.append(angleMapItem.value)
        }
        
        var sortedList = angles.sorted { element1, element2 -> Bool in
            return element1.first!.3 < element2.first!.3
        }

        var final = [(Int, Int, Int, Double, String)]()
        var index = 0
        while sortedList.count > 0 {
            var list = sortedList[index]
            var firstIem = list.first!
            final.append(firstIem)
            
            list.remove(at: 0)
            if (list.count > 0) {
                sortedList[index] = list
                index = index < sortedList.count - 1 ? index + 1 : 0
            } else {
                sortedList.remove(at: index)
                if index > sortedList.count - 1 {
                    index = 0
                }
            }
        }

        
        print(final)
        print(final[199])
    }
    
  func asteroidsInSite(input:String, startX: Int, startY: Int) -> Int {
              
              var result = Set<String>()
              
              self.enumeratedd(input:input, block: { x, y, element in
                  guard !(x == startX && y == startY) else { return }
                  guard element == "#" else { return }
                
                let xDiff = x - startX
                let yDiff = y - startY

                var angle = atan2(Double(yDiff), Double(xDiff)) + Double.pi / 2.0
                angle = abs(angle - 0.0) > 0.0000001 ? angle : 0.0
                angle = (angle > 0) ? angle : Double.pi * 2.0 + angle
                angle = (angle < Double.pi * 2.0) ? angle : angle - Double.pi * 2.0
                let ratio = Int(angle * 1_000_000.0)
                let hash = String(ratio)

                result.insert(hash)
              })
                 
                 return result.count
             }
    
    func asteroids(input:String, startX: Int, startY: Int) -> [(Int, Int, Int, Double, String)] {
                
                var result = [(Int, Int, Int, Double, String)]()
                
                self.enumeratedd(input:input, block: { x, y, element in
                    guard !(x == startX && y == startY) else { return }
                    guard element == "#" else { return }
                  
                  let xDiff = x - startX
                  let yDiff = y - startY
                    let level = max(abs(xDiff), abs(yDiff))

                  var angle = atan2(Double(yDiff), Double(xDiff)) + Double.pi / 2.0
                  angle = abs(angle - 0.0) > 0.0000001 ? angle : 0.0
                  angle = (angle > 0) ? angle : Double.pi * 2.0 + angle
                  angle = (angle < Double.pi * 2.0) ? angle : angle - Double.pi * 2.0//                  let ratio = Int(angle * 1_000_000.0)
//                  let hash = String(ratio)

                    result.append((x, y, level, angle, element))
                })
                   
                   return result
               }

    func enumeratedd(input:String, block: (Int, Int, String) -> Void) {
        let rows = input.split(separator: "\n")

        for rowEnumeration in rows.enumerated() {
            let y = rowEnumeration.offset
            for elementEnumer in rowEnumeration.element.enumerated() {
                let x = elementEnumer.offset
                let element = String(elementEnumer.element)
                
                block(x, y, element)
            }
        }
    }

}

