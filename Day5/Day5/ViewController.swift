//
//  ViewController.swift
//  Day5
//
//  Created by Kyle Rokita on 12/5/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let input = [3,225,1,225,6,6,1100,1,238,225,104,0,1102,59,58,224,1001,224,-3422,224,4,224,102,8,223,223,101,3,224,224,1,224,223,223,1101,59,30,225,1101,53,84,224,101,-137,224,224,4,224,1002,223,8,223,101,3,224,224,1,223,224,223,1102,42,83,225,2,140,88,224,1001,224,-4891,224,4,224,1002,223,8,223,1001,224,5,224,1,223,224,223,1101,61,67,225,101,46,62,224,1001,224,-129,224,4,224,1002,223,8,223,101,5,224,224,1,223,224,223,1102,53,40,225,1001,35,35,224,1001,224,-94,224,4,224,102,8,223,223,101,6,224,224,1,223,224,223,1101,5,73,225,1002,191,52,224,1001,224,-1872,224,4,224,1002,223,8,223,1001,224,5,224,1,223,224,223,102,82,195,224,101,-738,224,224,4,224,1002,223,8,223,1001,224,2,224,1,224,223,223,1101,83,52,225,1101,36,77,225,1101,9,10,225,1,113,187,224,1001,224,-136,224,4,224,1002,223,8,223,101,2,224,224,1,224,223,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1007,226,226,224,1002,223,2,223,1006,224,329,1001,223,1,223,1108,226,226,224,102,2,223,223,1006,224,344,101,1,223,223,1007,677,677,224,102,2,223,223,1006,224,359,101,1,223,223,1108,677,226,224,1002,223,2,223,1005,224,374,1001,223,1,223,7,677,226,224,102,2,223,223,1005,224,389,1001,223,1,223,1008,677,677,224,1002,223,2,223,1005,224,404,101,1,223,223,108,226,226,224,1002,223,2,223,1006,224,419,101,1,223,223,1008,226,677,224,1002,223,2,223,1006,224,434,1001,223,1,223,1107,677,226,224,1002,223,2,223,1005,224,449,101,1,223,223,1008,226,226,224,102,2,223,223,1005,224,464,1001,223,1,223,8,226,226,224,1002,223,2,223,1006,224,479,1001,223,1,223,107,226,677,224,102,2,223,223,1005,224,494,1001,223,1,223,7,226,226,224,102,2,223,223,1005,224,509,1001,223,1,223,107,226,226,224,102,2,223,223,1005,224,524,101,1,223,223,107,677,677,224,1002,223,2,223,1006,224,539,101,1,223,223,8,677,226,224,1002,223,2,223,1006,224,554,101,1,223,223,1107,677,677,224,1002,223,2,223,1005,224,569,101,1,223,223,108,226,677,224,1002,223,2,223,1006,224,584,101,1,223,223,7,226,677,224,1002,223,2,223,1005,224,599,1001,223,1,223,8,226,677,224,102,2,223,223,1006,224,614,1001,223,1,223,108,677,677,224,1002,223,2,223,1006,224,629,1001,223,1,223,1007,226,677,224,1002,223,2,223,1006,224,644,101,1,223,223,1108,226,677,224,102,2,223,223,1005,224,659,1001,223,1,223,1107,226,677,224,102,2,223,223,1006,224,674,1001,223,1,223,4,223,99,226]

        print(program(input, mainInput: 5))

    }



    enum ParameterModes: Int {
        case position, immediate
    }

    enum Instruction: Int {
        case add = 1, multiply, input, output, jumpiftrue, jumpiffalse, lessthan, equals
    }

    func program(_ ainput: [Int], mainInput: Int) -> [Int] {
        var outputs = [Int]()

        var input = ainput
        var index = 0

        repeat {
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
                var prefix = input[index]
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

            var updateIndex = true
            switch instruction.0 {
                case .add:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]
                    let arg3 = input[index + 3]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]
//                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]

                    input[arg3] = realArg1 + realArg2

                case .multiply:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]
                    let arg3 = input[index + 3]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]
//                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]

                    input[arg3] = realArg1 * realArg2

                case .input:
                    let arg1 = input[index + 1]

                    input[arg1] = mainInput

                case .output:
                    let arg1 = input[index + 1]
                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]

                    outputs.append(realArg1)
                case .jumpiftrue:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]

                    if realArg1 != 0 {
                        index = realArg2
                        updateIndex = false
                    }
                case .jumpiffalse:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]

                    if realArg1 == 0 {
                        index = realArg2
                        updateIndex = false
                    }
                case .lessthan:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]
                    let arg3 = input[index + 3]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]

                    input[arg3] = realArg1 < realArg2 ? 1 : 0
                case .equals:
                    let arg1 = input[index + 1]
                    let arg2 = input[index + 2]
                    let arg3 = input[index + 3]

                    let realArg1 = instruction.1[0] == .immediate ? arg1 : input[arg1]
                    let realArg2 = instruction.1[1] == .immediate ? arg2 : input[arg2]
                    //                    let realArg3 = instruction.1[2] == .immediate ? arg3 : input[arg3]

                    input[arg3] = realArg1 == realArg2 ? 1 : 0
            }

            if updateIndex {
                index += argCount(instruction: instruction.0) + 1
            }
        } while (input[index] != 99)

        return outputs
    }




}

