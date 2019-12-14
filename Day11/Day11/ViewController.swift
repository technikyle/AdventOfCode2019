//
//  ViewController.swift
//  Day5
//
//  Created by Kyle Rokita on 12/5/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IntCodeProgramDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let code = [3,8,1005,8,330,1106,0,11,0,0,0,104,1,104,0,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,102,1,8,29,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,0,10,4,10,101,0,8,51,1,1103,2,10,1006,0,94,1006,0,11,1,1106,13,10,3,8,1002,8,-1,10,101,1,10,10,4,10,1008,8,1,10,4,10,1001,8,0,87,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,1001,8,0,109,2,1105,5,10,2,103,16,10,1,1103,12,10,2,105,2,10,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,1001,8,0,146,1006,0,49,2,1,12,10,2,1006,6,10,1,1101,4,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,0,8,10,4,10,1001,8,0,183,1,6,9,10,1006,0,32,3,8,102,-1,8,10,1001,10,1,10,4,10,1008,8,1,10,4,10,101,0,8,213,2,1101,9,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,1,10,4,10,101,0,8,239,1006,0,47,1006,0,4,2,6,0,10,1006,0,58,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,0,10,4,10,102,1,8,274,2,1005,14,10,1006,0,17,1,104,20,10,1006,0,28,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,1002,8,1,309,101,1,9,9,1007,9,928,10,1005,10,15,99,109,652,104,0,104,1,21101,0,937263411860,1,21102,347,1,0,1105,1,451,21101,932440724376,0,1,21102,1,358,0,1105,1,451,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21101,0,29015167015,1,21101,0,405,0,1106,0,451,21102,1,3422723163,1,21101,0,416,0,1106,0,451,3,10,104,0,104,0,3,10,104,0,104,0,21101,0,868389376360,1,21101,0,439,0,1105,1,451,21102,825544712960,1,1,21102,1,450,0,1106,0,451,99,109,2,21201,-1,0,1,21101,0,40,2,21102,482,1,3,21102,1,472,0,1106,0,515,109,-2,2106,0,0,0,1,0,0,1,109,2,3,10,204,-1,1001,477,478,493,4,0,1001,477,1,477,108,4,477,10,1006,10,509,1101,0,0,477,109,-2,2106,0,0,0,109,4,2101,0,-1,514,1207,-3,0,10,1006,10,532,21102,1,0,-3,22101,0,-3,1,22102,1,-2,2,21102,1,1,3,21101,551,0,0,1106,0,556,109,-4,2105,1,0,109,5,1207,-3,1,10,1006,10,579,2207,-4,-2,10,1006,10,579,22102,1,-4,-4,1106,0,647,21201,-4,0,1,21201,-3,-1,2,21202,-2,2,3,21102,1,598,0,1106,0,556,22101,0,1,-4,21101,1,0,-1,2207,-4,-2,10,1006,10,617,21102,0,1,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,639,21201,-1,0,1,21102,639,1,0,105,1,514,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2105,1,0]
        
        program = IntCodeProgram(code: code, delegate: self, id: 0)
        map[self.hash(position: position)] = (1, 0)

        run()
        
    }
    
    func printMap() {
        var range : (minX: Int, maxX:Int, minY:Int, maxY:Int) = (Int.max, Int.min, Int.max, Int.min)
        for (key, value) in map {
            let position = key.split(separator: ":").map { Int($0)! }
            let x = position[0]
            let y = position[1]
            
            if x < range.minX {
                range.minX = x
            }
            if x > range.maxX {
                range.maxX = x
            }
            if y < range.minY {
                range.minY = y
            }
            if y > range.maxY {
                range.maxY = y
            }
        }
    
        let rows = range.maxY - range.minY + 1
        let columns = range.maxX - range.minX + 1
        var arrays = [[Int]].init(repeating: [Int].init(repeating: 0, count: columns), count: rows)
        
        for (key, value) in map {
            let position = key.split(separator: ":").map { Int($0)! }
            arrays[position[1] - range.minY][position[0] - range.minX] = value.color
        }
        
        for row in arrays {
            print(row.map({ return $0 == 1 ? "1" : " "}).joined())
        }
    }
    
    var program: IntCodeProgram!
    
    var inputs = [[Int]]()
    
    var map: [String: (color: Int, visits: Int)] = [:]
    var position: (x:Int, y:Int) = (0,0)
    var direction: Direction = .up

    enum Direction: Int {
        case left = 0, right, up, down
    }
    
    func hash(position:(Int, Int)) -> String {
        return String(position.0) + ":" + String(position.1)
    }

    func run() {
        let mapColor = map[self.hash(position: position)]?.color ?? 0
        program.inputs.append(mapColor)
        program.run()
    }
    
    func completed(program: IntCodeProgram) {
//        print(map.count)
        printMap()
    }
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) {
        var outputs = outputs
        guard outputs.count.isMultiple(of: 2) else { return }
//        print(outputs[outputs.count - 2...outputs.count - 1])
        program.paused = true
        let colorOutput = program.outputs[program.outputs.count - 2]
        let visits = map[self.hash(position: position)]?.visits ?? 0
        map[self.hash(position: position)] = (colorOutput, visits + 1)

        let turnOutput = program.outputs[program.outputs.count - 1]
        direction = turn(turnDirection: Direction(rawValue: turnOutput)!)
        
        position = nextPosition()
        
        DispatchQueue.main.async {
            self.run()
        }
    }
    
    func turn(turnDirection: Direction) -> Direction {
        switch direction {
            case .up:
                return turnDirection == .left ? .left : .right
            case .right:
                return turnDirection == .left ? .up : .down
            case .down:
                return turnDirection == .left ? .right : .left
            case .left:
                return turnDirection == .left ? .down : .up
        }
    }
    
    func nextPosition() -> (Int, Int) {
        switch direction {
            case .up:
                return (position.x, position.y - 1)
            case .right:
                return (position.x + 1, position.y)
            case .down:
                return (position.x, position.y + 1)
            case .left:
                return (position.x - 1, position.y)
        }
    }
}



protocol IntCodeProgramDelegate {
    func outputsChanged(outputs: [Int], program: IntCodeProgram)
    func completed(program: IntCodeProgram)
}

class IntCodeProgram {
    
    enum ParameterModes: Int {
        case position, immediate, relative
    }
    
    enum Instruction: Int {
        case add = 1, multiply, input, output, jumpiftrue, jumpiffalse, lessthan, equals, relativeBaseOffset
    }
    
    var id: Int
    var inputs: [Int] = []
    var inputIndex = 0
    var memoryIndex = 0
    var memory: [Int]
    var code: [Int]
    var relativeBase = 0
    
    var started: Bool = false
    var paused: Bool = true
    var completed:Bool = false {
        didSet {
            delegate.completed(program: self)
        }
    }
    
    var delegate:IntCodeProgramDelegate
    
    var outputs: [Int] = [] {
        didSet {
            delegate.outputsChanged(outputs: outputs, program: self)
        }
    }
    
    init(code: [Int], delegate: IntCodeProgramDelegate, id: Int) {
        self.id = id
        self.code = code
        self.delegate = delegate
        self.memory = code + [Int].init(repeating: 0, count: 100_000)
    }
    
    func run() {
        self.started = true
        self.paused = false
        
        while (!self.paused && !self.completed) {
            func argCount(instruction: Instruction) -> Int {
                switch instruction {
                    case .add:
                        return 3
                    case .multiply:
                        return 3
                    case .input:
                        return 1
                    case .output:
                        return 1
                    case .jumpiftrue:
                        return 2
                    case .jumpiffalse:
                        return 2
                    case .lessthan:
                        return 3
                    case .equals:
                        return 3
                    case .relativeBaseOffset:
                        return 1
                }
            }
            
            func instructions() -> (Instruction, [ParameterModes]) {
                let prefix = memory[memoryIndex]
                let digits = String(prefix).enumerated().map { Int(String($0.element))! }
                
                let instructionCode = digits[digits.count - 1] + (digits.count > 1 ? digits[digits.count - 2] * 10 : 0)
                let instruction = Instruction(rawValue: instructionCode)!
                
                let args = argCount(instruction: instruction)
                
                
                let parameterModes = digits.dropLast(digits.count > 1 ? 2 : 1)
                var parametersInReverse = Array(parameterModes.reversed())
                while parametersInReverse.count < args {
                    parametersInReverse.append(0)
                }
                
                let finalParameters = parametersInReverse.map { ParameterModes(rawValue: $0)! }
                
                return (instruction, finalParameters)
            }
            
            let instruction = instructions()
            
            func advanceMemoryIndex() {
                memoryIndex += argCount(instruction: instruction.0) + 1
                if memory[memoryIndex] == 99 {
                    self.completed = true
                }
            }
            
            func positionMode(index: Int) -> ParameterModes {
                return instruction.1[index]
            }
            
            func readMemory(index: Int) -> Int {
                let arg = memory[memoryIndex + index + 1]
                let mode = positionMode(index: index)
                switch mode {
                    case .immediate:
                        return arg
                    case .position:
                        return memory[arg]
                    case .relative:
                        return memory[relativeBase + arg]
                }
            }
            
            func writeMemory(index: Int, value:Int) {
                let arg = memory[memoryIndex + index + 1]
                let mode = positionMode(index: index)
                let address: Int
                switch mode {
                    case .immediate:
                        assertionFailure()
                        address = arg
                    case .position:
                        address = arg
                    case .relative:
                        address = relativeBase + arg
                }
                memory[address] = value
            }
            
            if (memory[memoryIndex] == 203) {
                print("")
            }
            
            switch instruction.0 {
                case .add:
                    let result = readMemory(index: 0) + readMemory(index: 1)
                    writeMemory(index: 2, value: result)
                    advanceMemoryIndex()
                
                case .multiply:
                    let result = readMemory(index: 0) * readMemory(index: 1)
                    writeMemory(index: 2, value: result)
                    advanceMemoryIndex()
                
                case .input:
                    writeMemory(index: 0, value: inputs[inputIndex])
                    inputIndex += 1
                    advanceMemoryIndex()
                
                case .output:
                    let result = readMemory(index: 0)
                    
                    advanceMemoryIndex()
                    outputs.append(result)
                
                case .jumpiftrue:
                    if readMemory(index: 0) != 0 {
                        memoryIndex = readMemory(index: 1)
                        if memory[memoryIndex] == 99 {
                            self.completed = true
                        }
                    }
                    else {
                        advanceMemoryIndex()
                }
                
                case .jumpiffalse:
                    if readMemory(index: 0) == 0 {
                        memoryIndex = readMemory(index: 1)
                        if memory[memoryIndex] == 99 {
                            self.completed = true
                        }
                    }
                    else {
                        advanceMemoryIndex()
                }
                
                case .lessthan:
                    let result = readMemory(index: 0) < readMemory(index: 1) ? 1 : 0
                    writeMemory(index: 2, value: result)
                    advanceMemoryIndex()
                
                case .equals:
                    let result = readMemory(index: 0) == readMemory(index: 1) ? 1 : 0
                    writeMemory(index: 2, value: result)
                    advanceMemoryIndex()
                
                case .relativeBaseOffset:
                    relativeBase += readMemory(index: 0)
                    advanceMemoryIndex()
            }
        }
    }
}
