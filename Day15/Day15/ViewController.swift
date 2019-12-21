//
//  ViewController.swift
//  Day5
//
//  Created by Kyle Rokita on 12/5/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SearchProgramInstanceDelegate {
    
     let code = [3,1033,1008,1033,1,1032,1005,1032,31,1008,1033,2,1032,1005,1032,58,1008,1033,3,1032,1005,1032,81,1008,1033,4,1032,1005,1032,104,99,101,0,1034,1039,1001,1036,0,1041,1001,1035,-1,1040,1008,1038,0,1043,102,-1,1043,1032,1,1037,1032,1042,1105,1,124,102,1,1034,1039,1002,1036,1,1041,1001,1035,1,1040,1008,1038,0,1043,1,1037,1038,1042,1106,0,124,1001,1034,-1,1039,1008,1036,0,1041,1002,1035,1,1040,102,1,1038,1043,102,1,1037,1042,1106,0,124,1001,1034,1,1039,1008,1036,0,1041,1001,1035,0,1040,1002,1038,1,1043,101,0,1037,1042,1006,1039,217,1006,1040,217,1008,1039,40,1032,1005,1032,217,1008,1040,40,1032,1005,1032,217,1008,1039,37,1032,1006,1032,165,1008,1040,33,1032,1006,1032,165,1101,0,2,1044,1106,0,224,2,1041,1043,1032,1006,1032,179,1101,0,1,1044,1105,1,224,1,1041,1043,1032,1006,1032,217,1,1042,1043,1032,1001,1032,-1,1032,1002,1032,39,1032,1,1032,1039,1032,101,-1,1032,1032,101,252,1032,211,1007,0,62,1044,1106,0,224,1101,0,0,1044,1106,0,224,1006,1044,247,101,0,1039,1034,1002,1040,1,1035,102,1,1041,1036,101,0,1043,1038,1001,1042,0,1037,4,1044,1106,0,0,60,10,88,42,71,78,10,10,70,23,65,29,47,58,86,53,77,61,77,63,18,9,20,68,45,15,67,3,95,10,14,30,81,53,3,83,46,31,95,43,94,40,21,54,93,91,35,80,9,17,81,94,59,83,49,96,61,63,24,85,69,82,45,71,48,39,32,69,93,11,90,19,78,54,79,66,6,13,76,2,67,69,10,9,66,43,73,2,92,39,12,99,33,89,18,9,78,11,96,23,55,96,49,12,85,93,49,22,70,93,59,76,68,55,66,54,32,34,36,53,64,84,87,61,43,79,7,9,66,40,69,9,76,92,18,78,49,39,80,32,70,52,74,37,86,11,77,51,15,28,84,19,13,75,28,86,3,82,93,15,79,61,93,93,31,87,43,67,44,83,78,43,46,46,12,89,19,85,44,95,65,24,70,93,50,98,72,66,80,23,87,19,97,40,25,9,49,6,81,35,9,52,71,27,63,3,96,94,21,24,48,79,67,72,72,15,85,93,22,95,34,3,63,21,79,9,51,92,45,87,25,41,80,13,88,68,66,18,85,75,39,80,17,54,93,89,65,21,91,73,53,60,69,29,82,99,5,22,65,9,69,61,80,63,38,71,61,61,11,68,30,74,11,26,53,59,97,2,12,74,79,44,73,72,27,17,34,92,26,27,88,66,5,97,34,81,86,30,35,6,64,36,34,65,80,12,90,65,95,21,90,55,43,71,89,56,97,91,27,27,73,80,34,22,48,89,84,35,88,90,47,4,32,77,31,2,82,66,76,43,74,68,56,78,36,59,66,58,75,89,96,51,51,97,34,49,86,70,26,46,89,43,99,97,66,32,51,32,77,33,86,92,56,68,64,39,83,55,25,98,24,56,73,21,98,39,24,67,21,4,76,10,32,91,53,82,37,59,72,63,78,43,67,2,72,69,50,71,19,72,92,51,12,93,61,88,24,84,35,93,30,63,70,7,78,83,42,63,6,25,24,73,76,22,99,68,14,85,14,75,32,88,42,47,97,2,91,97,51,79,12,71,91,7,1,87,82,21,98,63,37,19,85,1,48,77,54,76,12,92,28,91,25,85,88,8,92,32,67,18,56,51,67,58,80,59,77,76,25,7,73,58,72,96,75,15,27,37,23,83,58,68,83,50,67,41,39,89,24,1,83,63,8,64,54,76,50,3,89,97,74,48,15,91,22,37,71,77,9,1,85,38,23,58,10,75,86,72,80,59,24,64,7,63,85,53,61,89,68,7,80,4,68,56,39,66,31,69,6,7,76,88,17,89,42,64,56,11,97,65,64,71,88,61,31,32,53,88,99,55,73,20,90,10,86,32,50,89,53,83,42,80,28,63,98,38,85,72,57,88,23,52,96,77,39,65,88,40,26,91,56,1,94,51,94,24,20,81,74,23,45,72,56,22,84,70,44,50,68,32,98,51,75,3,61,75,59,3,7,98,76,45,78,47,74,60,69,78,54,67,29,63,47,79,72,57,73,44,63,98,6,93,36,20,27,90,77,39,44,64,68,47,48,69,78,29,76,48,1,81,10,67,32,72,47,89,83,18,39,85,65,97,15,59,13,74,29,84,50,80,94,8,27,83,67,43,75,52,96,17,82,29,83,45,85,82,71,76,44,30,10,91,16,7,31,63,2,68,75,46,70,28,93,91,17,13,81,57,93,32,27,65,61,93,11,84,10,66,14,83,14,77,26,77,13,86,21,84,87,87,34,99,69,88,1,74,61,72,54,93,16,76,54,86,63,94,13,79,24,97,0,0,21,21,1,10,1,0,0,0,0,0,0]
    
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    
    enum PositionType: Int {
        case wall, blank, end
    }
        
//    var programs: [SearchProgramInstance] = []
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier", size: 12.0)
        return label
    }()
    
    func stringFor(type: (PositionType, Int)) -> String {
        switch type.0 {
            case .blank:
                var string = String("\(type.1)".suffix(4))
                while string.count < 4 {
                    string = "0" + string
                }
                string = string.replacingCharacters(in: (string.startIndex...string.startIndex), with: " ")
                return string
            case .end:
                return "XXXX"
            case .wall:
                return "####"
        }
    }
    
    lazy var displayTextStartIndexes: [String.Index] = {
        var result = [String.Index]()
        var index = displayText.startIndex
        var length = 0
        while length < displayText.count {
            result.append(index)
            index = displayText.index(index, offsetBy: 1)
            length += 1
        }
        return result
    }()
    
    static let totalCells = 50
    static let cellOffset = 25

    var displayText = (0..<totalCells).map { _ in String.init(repeating: " ", count: totalCells * 4) }.joined(separator: "\n") {
        didSet {
            label.text = displayText
        }
    }
    
    var visitedPositions: [Position: (PositionType, Int, [Int])] = [:] {
        didSet {
            if self.isSecondPart {
                for (key, value) in visitedPositions {
                    let position = key
                    
                    var string = stringFor(type: (value.0, value.1))
                    
                    let shiftedPosition = Position(x: position.x + ViewController.cellOffset, y: position.y +  ViewController.cellOffset)
                    //                displayMap[shiftedPosition.y][shiftedPosition.x] = string
                    //                if string == "-" {
                    //                    displayMap[position.1][position.0 - 1] = string
                    //                    displayMap[position.1][position.0 + 1] = string
                    //                }
                    
                    let index = displayTextStartIndexes[shiftedPosition.y * (ViewController.totalCells * 4 + 1) + shiftedPosition.x * 4]
                    let nextIndex = displayText.index(index, offsetBy: 3)
                    self.displayText = displayText.replacingCharacters(in: (index...nextIndex), with: string)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        view.addConstraint(label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0))
        view.addConstraint(label.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        let searchInstance = SearchProgramInstance(code:code, id: 0, inputs: [], isSecondPart: false)
        searchFromPosition(inputs: [], continueProgram: searchInstance.program, isSecondPart: false)
        
//        let time = visitedPositions.reduce(into: 0) { result, element in
//            if element.value.1 > result && element.value.0 == PositionType.blank {
//                result = element.value.1
//            }
//        }
//        print(time)
    }
    
    var isSecondPart = false
    var isSecondPartStartingCount = 0
    var isSecondPartMaxCount = 0

    func searchFromPosition(inputs:[Int], exitAtEnd: Bool = true, continueProgram: IntCodeProgram, isSecondPart: Bool) {
        guard isSecondPart == self.isSecondPart else { return }
        let position = positionForInputs(inputs: continueProgram.inputs + inputs)
        if let visitedPosition = visitedPositions[position] {
            switch visitedPosition.0 {
                case .end:
                    if exitAtEnd {
                        return
                    } else {
                        break
                    }
                case .wall:
                    return
                case .blank:
                    break
            }
        }
        for direction in (1...4) {
            runProgram(inputs: inputs + [direction], continueProgram: continueProgram, isSecondPart: isSecondPart)
        }
    }
    
    func positionForInputs(inputs:[Int]) -> Position {
        var x = 0
        var y = 0
        
        for input in inputs {
            if input == 1 {
                // north
                y -= 1
            }
            else if input == 2 {
                y += 1
            }
            else if input == 3 {
                // west
                x -= 1
            } else if input == 4 {
                x += 1
            }
            else {
                assertionFailure()
                
            }
        }
        
        return Position(x: x, y: y)
    }
    
    func runProgram(inputs: [Int], continueProgram: IntCodeProgram, isSecondPart: Bool) {
        let searchInstance = SearchProgramInstance(code:nil, id: 0, inputs: inputs, isSecondPart: isSecondPart)
        searchInstance.delegate = self
//        programs.append(searchInstance)
        let nextProgram = continueProgram.copy(id: 0)
        nextProgram.inputs += inputs
        nextProgram.code = code
        searchInstance.program = nextProgram
        searchInstance.run()
    }
    
    func didComplete(outputs: [Int], program: IntCodeProgram, isSecondPart _isSecondPart: Bool) {
        guard !(self.isSecondPart && _isSecondPart == false) else { return }
        let position = positionForInputs(inputs: program.inputs)
        
        func moves() -> Int {
            return program.inputs.count - isSecondPartStartingCount
        }
        if let visitedPosition = visitedPositions[position] {
            if visitedPosition.1 <= moves() {
                return
            }
        }
        let positionType = PositionType(rawValue: outputs.last!)!
        if positionType == .end && !isSecondPart {
            
            let minX = visitedPositions.reduce(Int.max) { result, tuple -> Int in
                if tuple.key.x < result {
                    return tuple.key.x
                }
                return result
            }
            let maxX = visitedPositions.reduce(Int.min) { result, tuple -> Int in
                if tuple.key.x > result {
                    return tuple.key.x
                }
                return result
            }
            
            let minY = visitedPositions.reduce(Int.max) { result, tuple -> Int in
                if tuple.key.y < result {
                    return tuple.key.y
                }
                return result
            }
            let maxY = visitedPositions.reduce(Int.min) { result, tuple -> Int in
                if tuple.key.y > result {
                    return tuple.key.y
                }
                return result
            }
            print(minX)
            print(maxX)
            print(minY)
            print(maxY)
            
            visitedPositions = [:]
            isSecondPart = true
            isSecondPartStartingCount = program.inputs.count
        }
        visitedPositions[position] = (positionType, moves(), program.inputs)
        let isSecondPart = self.isSecondPart
        if isSecondPart && moves() > isSecondPartMaxCount {
            isSecondPartMaxCount = moves()
            print(program.inputs.count)
            print(isSecondPartMaxCount)
        }
        
        DispatchQueue.main.async {
            self.searchFromPosition(inputs:[], exitAtEnd: !isSecondPart, continueProgram: program, isSecondPart: isSecondPart)
        }
    }
}

protocol SearchProgramInstanceDelegate: class {
    func didComplete(outputs: [Int], program: IntCodeProgram, isSecondPart: Bool)
}

class SearchProgramInstance: IntCodeProgramDelegate {
    var program: IntCodeProgram
    weak var delegate: SearchProgramInstanceDelegate?
    var isSecondPart: Bool

    init(code:[Int]?, id: Int, inputs: [Int], isSecondPart: Bool) {
        self.program = IntCodeProgram(code: code, id: id)
        self.program.inputs = inputs
        self.isSecondPart = isSecondPart
    }

    func run() {
        program.delegate = self
        program.run()
    }
    
    func completed(program: IntCodeProgram) {
        
    }
    
    func willReadInputs(program: IntCodeProgram) {
        
    }
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) {
        if outputs.count == program.inputs.count {
            program.paused = true
            delegate?.didComplete(outputs: outputs, program: program, isSecondPart: isSecondPart)
        }
    }
    
}

protocol IntCodeProgramDelegate: class {
    func outputsChanged(outputs: [Int], program: IntCodeProgram)
    func completed(program: IntCodeProgram)
    func willReadInputs(program: IntCodeProgram)
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
            delegate?.completed(program: self)
        }
    }
    
    weak var delegate:IntCodeProgramDelegate?
    
    var outputs: [Int] = [] {
        didSet {
            delegate?.outputsChanged(outputs: outputs, program: self)
        }
    }
    
    init(code: [Int]?, id: Int, outputs:[Int]? = nil) {
        self.id = id
        if let code = code {
            self.code = code
            self.memory = code + [Int].init(repeating: 0, count: 100_000)
        }
        else {
            self.code = []
            self.memory = []
        }
        if let outputs = outputs {
            self.outputs = outputs
        }
    }
    
    func copy(id: Int) -> IntCodeProgram {
        let newProgram = IntCodeProgram(code: nil, id: id, outputs: self.outputs)
        newProgram.inputs = self.inputs
        newProgram.inputIndex = self.inputIndex
        newProgram.memoryIndex = self.memoryIndex
        newProgram.memory = self.memory
        newProgram.relativeBase = self.relativeBase
        newProgram.started = self.started
        newProgram.paused = self.paused
        newProgram.completed = self.completed
        newProgram.delegate = self.delegate
        return newProgram
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
                    delegate?.willReadInputs(program: self)
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
