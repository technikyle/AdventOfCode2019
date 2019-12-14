//
//  ViewController.swift
//  Day5
//
//  Created by Kyle Rokita on 12/5/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IntCodeProgramDelegate {

    func completed(program: IntCodeProgram) {

    }
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) {

    }
    
    var inputs = [[Int]]()
    var nextProgramId = 0
    
    var programs = [IntCodeProgram]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let code = [1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1101,0,3,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1101,0,252,1023,1101,0,0,1020,1102,1,39,1013,1102,1,234,1029,1102,26,1,1016,1101,37,0,1005,1101,0,27,1011,1101,21,0,1000,1101,0,29,1019,1101,35,0,1003,1102,22,1,1007,1102,1,32,1001,1101,1,0,1021,1102,1,216,1027,1102,30,1,1012,1102,1,24,1009,1101,36,0,1002,1101,0,31,1010,1101,0,243,1028,1102,787,1,1024,1102,255,1,1022,1102,33,1,1017,1102,1,23,1004,1102,778,1,1025,1102,1,28,1008,1101,0,223,1026,1102,1,25,1015,1101,0,20,1006,1102,34,1,1014,1101,38,0,1018,109,-4,1202,5,1,63,1008,63,32,63,1005,63,203,4,187,1106,0,207,1001,64,1,64,1002,64,2,64,109,37,2106,0,-6,1001,64,1,64,1106,0,225,4,213,1002,64,2,64,109,3,2106,0,-8,4,231,1001,64,1,64,1105,1,243,1002,64,2,64,109,-12,2105,1,-1,1105,1,261,4,249,1001,64,1,64,1002,64,2,64,109,-13,2102,1,-3,63,1008,63,31,63,1005,63,285,1001,64,1,64,1106,0,287,4,267,1002,64,2,64,109,6,21102,40,1,0,1008,1017,40,63,1005,63,313,4,293,1001,64,1,64,1105,1,313,1002,64,2,64,109,-10,2107,31,-6,63,1005,63,331,4,319,1105,1,335,1001,64,1,64,1002,64,2,64,109,-6,2102,1,7,63,1008,63,28,63,1005,63,357,4,341,1105,1,361,1001,64,1,64,1002,64,2,64,109,2,21107,41,40,8,1005,1011,377,1106,0,383,4,367,1001,64,1,64,1002,64,2,64,109,-1,1201,2,0,63,1008,63,26,63,1005,63,403,1106,0,409,4,389,1001,64,1,64,1002,64,2,64,109,22,1205,-4,425,1001,64,1,64,1105,1,427,4,415,1002,64,2,64,109,-9,21101,42,0,3,1008,1018,39,63,1005,63,451,1001,64,1,64,1105,1,453,4,433,1002,64,2,64,109,3,21107,43,44,0,1005,1018,475,4,459,1001,64,1,64,1105,1,475,1002,64,2,64,109,-7,21101,44,0,0,1008,1011,44,63,1005,63,497,4,481,1105,1,501,1001,64,1,64,1002,64,2,64,109,17,1206,-7,513,1105,1,519,4,507,1001,64,1,64,1002,64,2,64,109,-24,1207,5,25,63,1005,63,537,4,525,1105,1,541,1001,64,1,64,1002,64,2,64,109,7,21108,45,43,2,1005,1013,557,1106,0,563,4,547,1001,64,1,64,1002,64,2,64,109,-5,1207,-3,34,63,1005,63,583,1001,64,1,64,1106,0,585,4,569,1002,64,2,64,109,5,21108,46,46,5,1005,1016,607,4,591,1001,64,1,64,1105,1,607,1002,64,2,64,109,-12,2108,20,8,63,1005,63,627,1001,64,1,64,1105,1,629,4,613,1002,64,2,64,109,24,1206,-3,647,4,635,1001,64,1,64,1105,1,647,1002,64,2,64,109,-30,2108,32,8,63,1005,63,665,4,653,1106,0,669,1001,64,1,64,1002,64,2,64,109,22,1208,-9,20,63,1005,63,691,4,675,1001,64,1,64,1106,0,691,1002,64,2,64,109,-4,21102,47,1,3,1008,1014,49,63,1005,63,715,1001,64,1,64,1105,1,717,4,697,1002,64,2,64,109,-10,2101,0,1,63,1008,63,36,63,1005,63,743,4,723,1001,64,1,64,1105,1,743,1002,64,2,64,109,16,1201,-9,0,63,1008,63,28,63,1005,63,769,4,749,1001,64,1,64,1105,1,769,1002,64,2,64,109,2,2105,1,5,4,775,1001,64,1,64,1106,0,787,1002,64,2,64,109,-5,1202,-6,1,63,1008,63,26,63,1005,63,807,1106,0,813,4,793,1001,64,1,64,1002,64,2,64,109,-16,2107,37,4,63,1005,63,833,1001,64,1,64,1105,1,835,4,819,1002,64,2,64,109,2,2101,0,1,63,1008,63,34,63,1005,63,855,1105,1,861,4,841,1001,64,1,64,1002,64,2,64,109,19,1205,2,875,4,867,1105,1,879,1001,64,1,64,1002,64,2,64,109,-2,1208,-8,23,63,1005,63,899,1001,64,1,64,1106,0,901,4,885,4,64,99,21101,0,27,1,21102,915,1,0,1106,0,922,21201,1,61455,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21102,942,1,0,1105,1,922,22102,1,1,-1,21201,-2,-3,1,21102,1,957,0,1105,1,922,22201,1,-1,-2,1106,0,968,22101,0,-2,-2,109,-3,2105,1,0]
            
        let program = IntCodeProgram(code: code, delegate: self, id: 0)
        program.inputs = [2]
        program.run()
        
        print(program.outputs)
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
    var completed:Bool = false
    
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
                    }
                    else {
                        advanceMemoryIndex()
                    }
                
                case .jumpiffalse:
                    if readMemory(index: 0) == 0 {
                        memoryIndex = readMemory(index: 1)
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
