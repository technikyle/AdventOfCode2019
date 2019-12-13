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
        let outputIndex = (program.id + 1) % 5
        nextProgramId = outputIndex
        run()
    }
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) -> Bool {
        let output = outputs.last!
        let outputIndex = (program.id + 1) % 5
        nextProgramId = outputIndex
        inputs[outputIndex].append(output)
        run()
        return true
    }
    
    var inputs = [[Int]]()
    var nextProgramId = 0
    
    var programs = [IntCodeProgram]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let program = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
            
            inputs = [[Int]].init(repeating: [], count: 5)
            for i in (0..<5) {
                inputs[i].append(phases[i])
            }
            inputs[0].append(0)
            
            let program = IntCodeProgram(code: program, delegate: self, id: i)
            
            run()
            
            let lastOutput = inputs.first!.last!
            
            if lastOutput > maxSignal {
                maxSignal = lastOutput
                maxPhases = phases
            }
        
        print(maxSignal)
        print(maxPhases)
        
    }
    
    func run() {
        guard programs.contains(where: { return !$0.completed }) else {
            return
        }
        
        if programs[nextProgramId].completed {
            nextProgramId += 1
            run()
            return
        }
        
        let i = nextProgramId
        let program = programs[i]
        program.inputs = inputs[i]
        program.run()
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

protocol IntCodeProgramDelegate {
    func outputsChanged(outputs: [Int], program: IntCodeProgram) -> Bool
    func completed(program: IntCodeProgram)
}

class IntCodeProgram {
    
    enum ParameterModes: Int {
        case position, immediate
    }
    
    enum Instruction: Int {
        case add = 1, multiply, input, output, jumpiftrue, jumpiffalse, lessthan, equals
    }
    
    var id: Int
    var inputs: [Int] = []
    var inputIndex = 0
    var programIndex = 0
    var code: [Int]
    
    var started: Bool = false
    var paused: Bool = true
    var completed:Bool = false
    
    var delegate:IntCodeProgramDelegate
    
    var outputs: [Int] = [] {
        didSet {
            self.paused = delegate.outputsChanged(outputs: outputs, program: self)
        }
    }
    
    init(code: [Int], delegate: IntCodeProgramDelegate, id: Int) {
        self.id = id
        self.code = code
        self.delegate = delegate
    }
    
    func run() {
        self.started = true
        self.paused = false
        
        while (!self.paused && !self.completed && code[programIndex] != 99) {
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
                }
            }
            
            func instructions() -> (Instruction, [ParameterModes]) {
                var prefix = code[programIndex]
                var digits : [Int] = []
                
                while prefix > 0 {
                    let lastDigit = ((Double(prefix) / 10.0  - (Double(prefix) / 10.0).rounded(.down)) * 10.0).rounded()
                    digits.append(Int(lastDigit))
                    prefix = Int(Double(prefix) / 10.0)
                }
                let ordered = Array(digits.reversed())
                let instructionCode = Int(ordered[ordered.count - 1]) + (ordered.count > 1 ? Int(ordered[ordered.count - 2]) * 10 : 0)
                let instruction = Instruction(rawValue: instructionCode)!
                
                let args = argCount(instruction: instruction)
                
                
                let parameterModes = ordered.dropLast(ordered.count > 1 ? 2 : 1)
                var parametersInReverse = Array(parameterModes.reversed())
                while parametersInReverse.count < args {
                    parametersInReverse.append(0)
                }
                
                let finalParameters = parametersInReverse.map { ParameterModes(rawValue: $0)! }
                
                return (instruction, finalParameters)
            }
            
            let instruction = instructions()
            
            func advanceIndex() {
                programIndex += argCount(instruction: instruction.0) + 1
                if code[programIndex] == 99 {
                    self.completed = true
                }
            }
            
            switch instruction.0 {
                case .add:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    let arg3 = code[programIndex + 3]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]
                    
                    code[arg3] = realArg1 + realArg2
                    advanceIndex()
                case .multiply:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    let arg3 = code[programIndex + 3]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]
                    
                    code[arg3] = realArg1 * realArg2
                    advanceIndex()
                case .input:
                    let arg1 = code[programIndex + 1]
                    
                    code[arg1] = inputs[inputIndex]
                    inputIndex += 1
                    advanceIndex()
                case .output:
                    let arg1 = code[programIndex + 1]
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    
                    advanceIndex()
                    outputs.append(realArg1)
                case .jumpiftrue:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    
                    if realArg1 != 0 {
                        programIndex = realArg2
                    }
                    else {
                        advanceIndex()
                }
                case .jumpiffalse:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    
                    if realArg1 == 0 {
                        programIndex = realArg2
                    }
                    else {
                        advanceIndex()
                }
                case .lessthan:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    let arg3 = code[programIndex + 3]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]
                    
                    code[arg3] = realArg1 < realArg2 ? 1 : 0
                    advanceIndex()
                case .equals:
                    let arg1 = code[programIndex + 1]
                    let arg2 = code[programIndex + 2]
                    let arg3 = code[programIndex + 3]
                    
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : code[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : code[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]
                    
                    code[arg3] = realArg1 == realArg2 ? 1 : 0
                    advanceIndex()
            }
        }
    }
}
