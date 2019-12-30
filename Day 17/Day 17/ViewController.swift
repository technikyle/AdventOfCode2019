//
//  ViewController.swift
//  Day5
//
//  Created by Kyle Rokita on 12/5/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IntCodeProgramDelegate {
    
    let code = [2,330,331,332,109,3093,1102,1,1182,15,1101,1428,0,24,1002,0,1,570,1006,570,36,102,1,571,0,1001,570,-1,570,1001,24,1,24,1105,1,18,1008,571,0,571,1001,15,1,15,1008,15,1428,570,1006,570,14,21101,0,58,0,1106,0,786,1006,332,62,99,21102,333,1,1,21101,0,73,0,1106,0,579,1101,0,0,572,1101,0,0,573,3,574,101,1,573,573,1007,574,65,570,1005,570,151,107,67,574,570,1005,570,151,1001,574,-64,574,1002,574,-1,574,1001,572,1,572,1007,572,11,570,1006,570,165,101,1182,572,127,102,1,574,0,3,574,101,1,573,573,1008,574,10,570,1005,570,189,1008,574,44,570,1006,570,158,1105,1,81,21102,340,1,1,1105,1,177,21101,477,0,1,1106,0,177,21102,1,514,1,21101,0,176,0,1105,1,579,99,21101,0,184,0,1106,0,579,4,574,104,10,99,1007,573,22,570,1006,570,165,102,1,572,1182,21102,375,1,1,21102,211,1,0,1106,0,579,21101,1182,11,1,21101,222,0,0,1105,1,979,21102,1,388,1,21101,0,233,0,1105,1,579,21101,1182,22,1,21101,244,0,0,1105,1,979,21101,0,401,1,21102,255,1,0,1105,1,579,21101,1182,33,1,21102,1,266,0,1106,0,979,21102,414,1,1,21101,0,277,0,1106,0,579,3,575,1008,575,89,570,1008,575,121,575,1,575,570,575,3,574,1008,574,10,570,1006,570,291,104,10,21101,1182,0,1,21102,1,313,0,1105,1,622,1005,575,327,1102,1,1,575,21101,327,0,0,1105,1,786,4,438,99,0,1,1,6,77,97,105,110,58,10,33,10,69,120,112,101,99,116,101,100,32,102,117,110,99,116,105,111,110,32,110,97,109,101,32,98,117,116,32,103,111,116,58,32,0,12,70,117,110,99,116,105,111,110,32,65,58,10,12,70,117,110,99,116,105,111,110,32,66,58,10,12,70,117,110,99,116,105,111,110,32,67,58,10,23,67,111,110,116,105,110,117,111,117,115,32,118,105,100,101,111,32,102,101,101,100,63,10,0,37,10,69,120,112,101,99,116,101,100,32,82,44,32,76,44,32,111,114,32,100,105,115,116,97,110,99,101,32,98,117,116,32,103,111,116,58,32,36,10,69,120,112,101,99,116,101,100,32,99,111,109,109,97,32,111,114,32,110,101,119,108,105,110,101,32,98,117,116,32,103,111,116,58,32,43,10,68,101,102,105,110,105,116,105,111,110,115,32,109,97,121,32,98,101,32,97,116,32,109,111,115,116,32,50,48,32,99,104,97,114,97,99,116,101,114,115,33,10,94,62,118,60,0,1,0,-1,-1,0,1,0,0,0,0,0,0,1,32,0,0,109,4,1201,-3,0,587,20102,1,0,-1,22101,1,-3,-3,21102,1,0,-2,2208,-2,-1,570,1005,570,617,2201,-3,-2,609,4,0,21201,-2,1,-2,1105,1,597,109,-4,2106,0,0,109,5,1202,-4,1,630,20101,0,0,-2,22101,1,-4,-4,21102,1,0,-3,2208,-3,-2,570,1005,570,781,2201,-4,-3,652,21001,0,0,-1,1208,-1,-4,570,1005,570,709,1208,-1,-5,570,1005,570,734,1207,-1,0,570,1005,570,759,1206,-1,774,1001,578,562,684,1,0,576,576,1001,578,566,692,1,0,577,577,21101,0,702,0,1106,0,786,21201,-1,-1,-1,1105,1,676,1001,578,1,578,1008,578,4,570,1006,570,724,1001,578,-4,578,21102,731,1,0,1105,1,786,1106,0,774,1001,578,-1,578,1008,578,-1,570,1006,570,749,1001,578,4,578,21102,756,1,0,1105,1,786,1105,1,774,21202,-1,-11,1,22101,1182,1,1,21101,0,774,0,1106,0,622,21201,-3,1,-3,1105,1,640,109,-5,2105,1,0,109,7,1005,575,802,20102,1,576,-6,20102,1,577,-5,1106,0,814,21101,0,0,-1,21102,1,0,-5,21101,0,0,-6,20208,-6,576,-2,208,-5,577,570,22002,570,-2,-2,21202,-5,37,-3,22201,-6,-3,-3,22101,1428,-3,-3,2102,1,-3,843,1005,0,863,21202,-2,42,-4,22101,46,-4,-4,1206,-2,924,21101,1,0,-1,1105,1,924,1205,-2,873,21101,0,35,-4,1105,1,924,2102,1,-3,878,1008,0,1,570,1006,570,916,1001,374,1,374,2102,1,-3,895,1101,0,2,0,1202,-3,1,902,1001,438,0,438,2202,-6,-5,570,1,570,374,570,1,570,438,438,1001,578,558,921,21002,0,1,-4,1006,575,959,204,-4,22101,1,-6,-6,1208,-6,37,570,1006,570,814,104,10,22101,1,-5,-5,1208,-5,45,570,1006,570,810,104,10,1206,-1,974,99,1206,-1,974,1101,1,0,575,21102,973,1,0,1105,1,786,99,109,-7,2106,0,0,109,6,21101,0,0,-4,21102,0,1,-3,203,-2,22101,1,-3,-3,21208,-2,82,-1,1205,-1,1030,21208,-2,76,-1,1205,-1,1037,21207,-2,48,-1,1205,-1,1124,22107,57,-2,-1,1205,-1,1124,21201,-2,-48,-2,1106,0,1041,21102,-4,1,-2,1106,0,1041,21101,0,-5,-2,21201,-4,1,-4,21207,-4,11,-1,1206,-1,1138,2201,-5,-4,1059,2102,1,-2,0,203,-2,22101,1,-3,-3,21207,-2,48,-1,1205,-1,1107,22107,57,-2,-1,1205,-1,1107,21201,-2,-48,-2,2201,-5,-4,1090,20102,10,0,-1,22201,-2,-1,-2,2201,-5,-4,1103,2101,0,-2,0,1106,0,1060,21208,-2,10,-1,1205,-1,1162,21208,-2,44,-1,1206,-1,1131,1105,1,989,21102,1,439,1,1105,1,1150,21101,0,477,1,1106,0,1150,21102,514,1,1,21101,0,1149,0,1105,1,579,99,21101,0,1157,0,1106,0,579,204,-2,104,10,99,21207,-3,22,-1,1206,-1,1138,2102,1,-5,1176,2101,0,-4,0,109,-6,2106,0,0,20,13,24,1,32,7,30,1,3,1,1,1,30,1,3,1,1,1,30,1,3,1,1,1,30,1,1,5,30,1,1,1,1,1,26,13,24,1,5,1,1,1,1,1,1,1,24,1,5,1,1,1,1,1,1,1,24,1,5,1,1,1,1,1,1,1,24,1,5,5,1,1,24,1,7,1,3,1,14,5,5,1,7,1,3,13,2,1,3,1,5,1,7,1,15,1,2,1,3,1,5,1,7,1,15,1,2,1,3,1,5,1,7,1,15,1,2,1,3,1,5,1,7,13,3,1,2,1,9,1,19,1,3,1,2,11,19,1,3,1,32,1,3,1,26,7,3,1,26,1,9,1,24,11,1,1,24,1,1,1,7,1,1,1,24,1,1,1,3,7,24,1,1,1,3,1,3,1,26,13,26,1,3,1,3,1,1,1,26,1,3,5,1,1,26,1,9,1,26,1,9,1,26,1,9,1,26,13,34,1,1,1,34,1,1,1,34,1,1,1,34,1,1,1,34,1,1,1,30,5,1,1,30,1,5,1,30,1,5,1,30,1,5,1,30,7]
    
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    
    enum PositionType: String {
        case scaffold = "#", blank = ".", robotUp = "^", robotDown = "v", robotLeft = "<", robotRight = ">"
    }
    
    //    var programs: [SearchProgramInstance] = []
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier", size: 12.0)
        return label
    }()
    
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
    
    static let totalCellsX = 37
    static let totalCellsY = 47

    static let cellOffsetX = 0
    static let cellOffsetY = 0

    var displayText = (0..<totalCellsY).map { _ in String.init(repeating: " ", count: totalCellsX) }.joined(separator: "\n") {
        didSet {
            label.text = displayText
        }
    }
    
    var visitedPositions: [Position: PositionType] = [:]
    {
        didSet {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        view.addConstraint(label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0))
        view.addConstraint(label.centerXAnchor.constraint(equalTo: view.centerXAnchor))
                
        //        let time = visitedPositions.reduce(into: 0) { result, element in
        //            if element.value.1 > result && element.value.0 == PositionType.blank {
        //                result = element.value.1
        //            }
        //        }
        //        print(time)
        
        program = IntCodeProgram(code: code, id: 0)
        program.delegate = self
        program.run()

    }

    
    var program: IntCodeProgram!
    weak var delegate: IntCodeProgramDelegate?
    
    func completed(program: IntCodeProgram) {
     
    }
    
    func willReadInputs(program: IntCodeProgram) {
        show()
        
        var path = findPath()
        var pathList = Array<Instruction>()
        path.forEach { pathList.append($0) }
        print(combinePath(instruction: pathList))
        
//        var test: [Instruction] = []
//
//        for i in (0..<10) {
//            let random = Int.random(in: (0..<3))
//            if random == 0 {
//                test.append(.l)
//            }
//            else if random == 1 {
//                test.append(.r)
//            }
//            else {
//                for _ in (0..<random) {
//                    test.append(.forward(1))
//                }
//            }
//        }
//
//        print(test)
        
//        path = [.r, .forward(1), .forward(1), .l, .r]
    
        
        var list = Array<Instruction>()
        path.forEach { list.append($0) }
        
        list = combinePath(instruction: list)
        
//        let answer = calculateMovements(movements: list)
        let answer = findSubPaths(instruction: list)
        print(answer)
        
        var bits =  answer.main.map { $0.rawValue }.joined(separator: ",") + ["\n"]
        bits += answer.a.map { $0.stringValue }.joined(separator: ",") + ["\n"]
        bits +=     answer.b.map { $0.stringValue }.joined(separator: ",") + ["\n"]
        bits +=     answer.c.map { $0.stringValue }.joined(separator: ",") + ["\n"]
        
        program.inputs += bits.map { ViewController.convertFromString(text: String($0))}
        
        print("")
        
        x = 0
        y = 0
    }
    
    var outputsIndex = 0
    
    var x = 0
    var y = 0
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) {
        
        let output = outputs.last!
        
        let thisString = ViewController.convertToString(ascii: output)
        let position = Position(x: x, y: y)
        
        x += 1
        
        if thisString == "\n" {
            x = 0
            y += 1
        }
        
        if thisString != "\n" {
            if let positionType = PositionType(rawValue: thisString) {
                visitedPositions[position] = positionType
            }
            else {
                print(thisString)
            }
        }
    
    }
    
    let asciiNewLine = convertFromString(text: "\n")
    let asciiComma = convertFromString(text: ",")
    let asciiYes = convertFromString(text: "y")
    let asciiRight = convertFromString(text: "R")
    let asciiLeft = convertFromString(text: "L")
    let asciiA = convertFromString(text: "A")
    let asciiB = convertFromString(text: "B")
    let asciiC = convertFromString(text: "C")

    func findIntersections() {
        var intersections = Set<Position>()
        for (position, value) in visitedPositions {
            if value == .scaffold && checkIfIntersection(position: position) {
                intersections.insert(position)
            }
        }

        let parameter = intersections.reduce(0) { result, position -> Int in
            return result + position.x * position.y
        }
        
        print(parameter)
        
    }
    
    enum Main: String {
        case A
        case B
        case C
    }
    
    enum Instruction: Equatable {
        case r
        case l
        case forward(Int)
        
        var stringValue: String {
            switch self {
                case .r:
                    return "R"
                case .l:
                    return "L"
                case .forward(let count):
                    return "\(count)"
            }
        }
    }
    
    struct Result {
        var main: Array<Main> = Array()
        var a: Array<Instruction> = Array()
        var b: Array<Instruction> = Array()
        var c: Array<Instruction> = Array()
    }
    
    func findSubPaths(instruction: Array<Instruction>) -> Result {
        var overallResult = Result()
        var instruction = instruction
        var instructionOffset: Int = 0
        var didComplete = false
        
        func recurseRemaining() {
            for j in (0..<instruction.count - instructionOffset) {
                guard !didComplete else { break }
                let i = j + 1
                
                var thisInstruction = Array(instruction[instructionOffset..<instructionOffset+i])

                guard thisInstruction.count > 0 else {
                    assertionFailure()
                    return
                }
                
                var main: Main?
                var prior: [Instruction] = []

                var shouldContinue = true
                if overallResult.a.isEmpty || overallResult.a == thisInstruction {
                    main = .A                }
                else if overallResult.b.isEmpty || overallResult.b == thisInstruction {
                    main = .B
                } else if overallResult.c.isEmpty || overallResult.c == thisInstruction {
                    main = .C
                } else {
                    shouldContinue = false
                }
                
                if shouldContinue, let main = main {
                    switch main {
                        case .A:
                            overallResult.main.append(.A)
                            prior = overallResult.a
                            overallResult.a = thisInstruction
                        case .B:
                            overallResult.main.append(.B)
                            prior = overallResult.b
                            overallResult.b = thisInstruction
                        case .C:
                            overallResult.main.append(.C)
                            prior = overallResult.c
                            overallResult.c = thisInstruction
                    }
                    
//                    let thisCombinedInstruction = combinePath(instruction: thisInstruction)

                    if  overallResult.main.count + (overallResult.main.count - 1) > 20 ||
                    thisInstruction.count + (thisInstruction.count - 1) > 20 {
                        shouldContinue = false
                    }
                }

                if shouldContinue {
                    if i == instruction.count - instructionOffset {
                        didComplete = true
                        return
                    }
                    
                    instructionOffset += i
                    
                    guard !didComplete else { return }
                    
                    recurseRemaining()
                    
                    guard !didComplete else { return }

                    instructionOffset -= i
                }
                
                guard !didComplete else { return }
                
                if let main = main {
                    let thisMain = overallResult.main.popLast()
                    
                    guard thisMain == main else {
                        return
                    }
                    
                    switch main {
                        case .A:
                            overallResult.a = prior
                        case .B:
                            overallResult.b = prior
                        case .C:
                            overallResult.c = prior
                    }
                    
                }
            }
        }

        recurseRemaining()
        return overallResult
    }
    
    func combinePath(instruction: Array<Instruction>) -> Array<Instruction> {
        var combinedIntruction = Array<Instruction>()
        
        for tuple in instruction.enumerated() {
            switch tuple.element {
                case .l:
                    combinedIntruction.append(.l)
                case .r:
                    combinedIntruction.append(.r)
                case .forward(let count):
                    if let lastInstruction = combinedIntruction.last {
                        switch lastInstruction {
                            case .forward(let thisCount):
                                combinedIntruction[combinedIntruction.count - 1] = .forward(count + thisCount)
                            default:
                                combinedIntruction.append(.forward(1))
                        }
                    } else {
                        combinedIntruction.append(.forward(1))
                }
            }
        }
                
        return combinedIntruction
    }
    
    func findPath() -> [Instruction] {
        
        var visitedPositions = self.visitedPositions
        
        var instruction = [Instruction]()
        let startingPosition = visitedPositions.first { tuple -> Bool in
            switch tuple.value {
                case .robotDown:
                 return true
                case .robotUp:
                    return true
                case .robotLeft:
                    return true
                case .robotRight:
                    return true
                default:
                    return false
            }
        }

        var position: (key: ViewController.Position, value: ViewController.PositionType)? = startingPosition
        
        while position != nil {
            guard let thisPosition = position else { break }
            
            func forwardPosition() -> (key: ViewController.Position, value: ViewController.PositionType) {
                switch thisPosition.value {
                    case .robotDown:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y + 1), thisPosition.value)
                    case .robotUp:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y - 1), thisPosition.value)
                    case .robotLeft:
                        return (Position(x: thisPosition.key.x - 1, y: thisPosition.key.y), thisPosition.value)
                    case .robotRight:
                        return (Position(x: thisPosition.key.x + 1, y: thisPosition.key.y), thisPosition.value)
                    default:
                        assertionFailure()
                        return (Position(x: 0, y: 0),thisPosition.value)
                }
            }
            
            func rightPosition() -> (key: ViewController.Position, value: ViewController.PositionType) {
                switch thisPosition.value {
                    case .robotDown:
                        return (Position(x: thisPosition.key.x - 1, y: thisPosition.key.y), .robotLeft)
                    case .robotUp:
                        return (Position(x: thisPosition.key.x + 1, y: thisPosition.key.y), .robotRight)
                    case .robotLeft:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y - 1), .robotUp)
                    case .robotRight:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y + 1), .robotDown)
                    default:
                        assertionFailure()
                        return (Position(x: 0, y: 0),thisPosition.value)
                }
            }
            
            func leftPosition() -> (key: ViewController.Position, value: ViewController.PositionType) {
                switch thisPosition.value {
                    case .robotDown:
                        return (Position(x: thisPosition.key.x + 1, y: thisPosition.key.y), .robotRight)
                    case .robotUp:
                        return (Position(x: thisPosition.key.x - 1, y: thisPosition.key.y), .robotLeft)
                    case .robotLeft:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y + 1), .robotDown)
                    case .robotRight:
                        return (Position(x: thisPosition.key.x, y: thisPosition.key.y - 1), .robotUp)
                    default:
                        assertionFailure()
                        return (Position(x: 0, y: 0),thisPosition.value)
                }
            }
            
            let possibleForwardPosition = forwardPosition()
            let possibleLeftPosition = leftPosition()
            let possibleRightPosition = rightPosition()

            func isPositionValid(position: Position) -> Bool {
                guard let validPosition = visitedPositions[position] else { return false }
                
                switch validPosition {
                    case .scaffold:
                       return true
                    default:
                        return false
                }
            }
            
            if isPositionValid(position: possibleForwardPosition.key) {
                position = possibleForwardPosition
                instruction.append(.forward(1))
            } else if isPositionValid(position: possibleLeftPosition.key) {
                position = possibleLeftPosition
                instruction.append(.l)
                instruction.append(.forward(1))
            } else if isPositionValid(position: possibleRightPosition.key) {
                position = possibleRightPosition
                instruction.append(.r)
                instruction.append(.forward(1))
            } else {
                position = nil
            }
        }
     
        return instruction
    }
    
    func calculateMovements(movements: [Instruction]) -> [String] {
        let finalMovements = movements
        
        var aFunction: String = ""
        var bFunction: String = ""
        var cFunction: String = ""
        var mainRoutine: String = ""
        
        var startIndexes: [(Int,Int,Int)] = []
        
        for aIndex in 0 ..< finalMovements.count - 2 {
            for bIndex in aIndex + 1 ..< finalMovements.count - 1 {
                for cIndex in bIndex + 1 ..< finalMovements.count {
                    startIndexes.append((aIndex, bIndex, cIndex))
                }
            }
        }
        
        for (aIndex, bIndex, cIndex) in startIndexes {
            var aSize = 1
            var bSize = 1
            var cSize = 1
            
            while cIndex + cSize < finalMovements.count {
                let aSlice = finalMovements[aIndex ..< aIndex + aSize]
                let bSlice = finalMovements[bIndex ..< bIndex + bSize]
                let cSlice = finalMovements[cIndex ..< cIndex + cSize]
                
                aFunction = aSlice.map { $0.stringValue }.joined(separator: ",")
                bFunction = bSlice.map { $0.stringValue }.joined(separator: ",")
                cFunction = cSlice.map { $0.stringValue }.joined(separator: ",")
                
                var currentMovements = finalMovements
                mainRoutine = ""
                
                if aFunction.count <= 20 && bFunction.count <= 20 && cFunction.count <= 20 {
                    while !currentMovements.isEmpty && mainRoutine.count <= 20 {
                        if aSlice.count <= currentMovements.count && aSlice == currentMovements[0 ..< aSlice.count] {
                            if !mainRoutine.isEmpty {
                                mainRoutine.append(",")
                            }
                            
                            mainRoutine.append("A")
                            
                            currentMovements.removeFirst(aSlice.count)
                        } else if bSlice.count <= currentMovements.count && bSlice == currentMovements[0 ..< bSlice.count] {
                            if !mainRoutine.isEmpty {
                                mainRoutine.append(",")
                            }
                            
                            mainRoutine.append("B")
                            
                            currentMovements.removeFirst(bSlice.count)
                        } else if cSlice.count <= currentMovements.count && cSlice == currentMovements[0 ..< cSlice.count] {
                            if !mainRoutine.isEmpty {
                                mainRoutine.append(",")
                            }
                            
                            mainRoutine.append("C")
                            
                            currentMovements.removeFirst(cSlice.count)
                        } else {
                            break
                        }
                    }
                }
                
                if currentMovements.isEmpty {
                    if mainRoutine.count <= 20 {
                        print()
                        print("Match:")
                        print("A: \(aFunction)")
                        print("B: \(bFunction)")
                        print("C: \(cFunction)")
                        print("Main: \(mainRoutine)")
                        
                        return [mainRoutine, aFunction, bFunction, cFunction]
                    }
                }
                
                aSize += 1
                
                if aIndex + aSize >= finalMovements.count {
                    aSize = 1
                    bSize += 1
                }
                
                if bIndex + bSize >= finalMovements.count {
                    aSize = 1
                    bSize = 1
                    cSize += 1
                }
            }
        }
        
        fatalError("No way to build functions")
    }
    
    func show() {
        var rows = [[String]].init(repeating: [String].init(repeating: "", count: 37), count: 47)
        for (key, value) in visitedPositions {
//            let position = key
//
//            var string = value.rawValue
//
//            let shiftedPosition = Position(x: position.x + ViewController.cellOffsetX, y: position.y +  ViewController.cellOffsetY)
//            //                displayMap[shiftedPosition.y][shiftedPosition.x] = string
//            //                if string == "-" {
//            //                    displayMap[position.1][position.0 - 1] = string
//            //                    displayMap[position.1][position.0 + 1] = string
//            //                }
//
//            let index = displayTextStartIndexes[shiftedPosition.y * (ViewController.totalCellsX + 1) + shiftedPosition.x]
//            let nextIndex = displayText.index(index, offsetBy: 1)
//            self.displayText = displayText.replacingCharacters(in: (index...nextIndex), with: string)
            
            rows[key.y][key.x] = value.rawValue
        }
        
        print("")
        for row in rows {
            print(row.joined())
        }
    }
    
    func checkIfIntersection(position: Position) -> Bool {
        var children = 0
        var x = position.x
        var y = position.y
        for i in (0..<4) {
            y = position.y
            x = position.x

            if i == 0 {
                x += 1
                y = position.y
            }
            else if i == 1 {
                x -= 1
                y = position.y
            }
            else if i == 2 {
                y += 1
                x = position.x
            }
            else if i == 3 {
                y -= 1
                x = position.x
            }
            let positionToCheck = Position(x: x, y: y)
            if let visitedPositon = visitedPositions[positionToCheck] {
                if visitedPositon == .scaffold {
                    children += 1
                }
            }
        }

        return children > 2
    }
        
    static func convertToString(ascii: Int) -> String {
        let s = String(UnicodeScalar(UInt8(ascii)))
        return s
    }
    
    static func convertFromString(text: String) -> Int {
        let s = Int(text.unicodeScalars.first!.value)
        return s
    }
    
    func didComplete(outputs: [Int], program: IntCodeProgram, isSecondPart _isSecondPart: Bool) {
        print(outputs)
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
//
//struct DoublyLinkedList<Element> {
//    class Node {
//        var value: Element
//        weak var next: Node?
//        var previous: Node?
//        init(_ value: Element, next: Node?, previous: Node?) {
//            (self.value, self.next, self.previous) = (value, next, previous)
//            next?.previous = self
//            previous?.next = self
//        }
//    }
//    fileprivate var first: Node?
//    fileprivate var last: Node?
//    private(set) var count = 0
//    var isEmpty: Bool {
//        return count == 0
//    }
//    init() { }
//    init<S: Sequence>(_ s: S) where S.Iterator.Element == Element {
//        for entry in s {
//            pushLast(entry)
//        }
//    }
//    mutating func pop() -> Element? {
//        let f = first
//        if let f = f {
//            first = f.previous
//            first?.next = nil
//            count -= 1
//            if isEmpty {
//                last = nil
//            }
//        }
//        return f?.value
//    }
//    mutating func push(_ v: Element) {
//        first = Node(v, next: nil, previous: first)
//        if isEmpty {
//            last = first
//        }
//        count += 1
//    }
//    mutating func popLast() -> Element? {
//        let l = last
//        if let l = l {
//            last = l.next
//            last?.previous = nil
//            count -= 1
//            if isEmpty {
//                first = nil
//            }
//        }
//        return l?.value
//    }
//    mutating func pushLast(_ v: Element) {
//        last = Node(v, next: last, previous: nil)
//        if isEmpty {
//            first = last
//        }
//        count += 1
//    }
//    mutating func insert(_ v: Element, after succeeds: (Element) -> Bool) {
//        var cursor = first
//        while let value = cursor?.value {
//            if succeeds(value) {
//                insert(v, after: cursor)
//                return
//            }
//            cursor = cursor?.previous
//        }
//    }
//    private mutating func insert(_ v: Element, after cursor: Node?) {
//        let node = Node(v, next: cursor, previous: cursor?.previous)
//        if cursor === last {
//            last = node
//        }
//        count += 1
//    }
//    mutating func insert(_ v: Element, before succeeds: (Element) -> Bool) {
//        var cursor = first
//        while let value = cursor?.value {
//            if succeeds(value) {
//                insert(v, before: cursor)
//                return
//            }
//            cursor = cursor?.previous
//        }
//    }
//    mutating func insert(_ v: Element, at index: Int) {
//        let cursor = nodeAt(index: index)
//        if isEmpty {
//            push(v)
//        } else if cursor != nil {
//            insert(v, before: cursor)
//        } else {
//            pushLast(v)
//        }
//    }
//    private mutating func insert(_ v: Element, before cursor: Node?) {
//        let node = Node(v, next: cursor?.next, previous: cursor)
//        if cursor === first {
//            first = node
//        }
//        count += 1
//    }
//    mutating func removeAt(index: Int) -> Element? {
//        return remove(node: nodeAt(index: index))
//    }
//    mutating func remove(where succeeds: (Element) -> Bool) -> Element? {
//        var cursor = first
//        while let value = cursor?.value {
//            if succeeds(value) {
//                return remove(node: cursor)
//            }
//            cursor = cursor?.previous
//        }
//        return nil
//    }
//    private mutating func remove(node: Node?) -> Element? {
//        if count < 2 {
//            pop()
//        } else {
//            node?.previous?.next = node?.next
//            node?.next?.previous = node?.previous
//            count -= 1
//        }
//        if node === last {
//            last = node?.next
//        }
//        if node === first {
//            first = node?.previous
//        }
//        return node?.value
//    }
//    fileprivate func nodeAt(index: Int) -> Node? {
//        var counter = index
//        var cursor = first
//        while counter > 0 && cursor != nil {
//            counter -= 1
//            cursor = cursor?.previous
//        }
//        return cursor
//    }
//    subscript(index: Int) -> Element? {
//        get {
//            return nodeAt(index: index)?.value
//        }
//        set {
//            if let new = newValue {
//                nodeAt(index: index)?.value = new
//            }
//        }
//    }
//    subscript(bounds: Range<Int>) -> DoublyLinkedList<Element>? {
//        get {
//            var list = DoublyLinkedList<Element>()
//            bounds.forEach {
//                if let value = nodeAt(index: $0)?.value {
//                    list.pushLast(value)
//                }
//                else {
//                    assertionFailure()
//                }
//            }
//            return list
//        }
//        set {
//            if let new = newValue {
//                for i in bounds {
//                    if let new = new[i] {
//                        nodeAt(index: i)?.value = new
//                    }
//                }
//            }
//        }
//    }
//}
//extension DoublyLinkedList: CustomStringConvertible {
//    var description: String {
//        var elements = [Element]()
//        var cursor = first
//        while let value = cursor?.value {
//            elements.append(value)
//            cursor = cursor?.previous
//        }
//        return elements.map { "\($0)" }.joined(separator: ", ")
//    }
//}
//extension DoublyLinkedList: CustomDebugStringConvertible {
//    var debugDescription: String {
//        var elements = [Element]()
//        var cursor = first
//        while let value = cursor?.value {
//            elements.append(value)
//            cursor = cursor?.previous
//        }
//        return elements.map { "\($0)" }.joined(separator: ", ")
//    }
//}
//extension DoublyLinkedList where Element: Equatable {
//    static func ==(lhs: DoublyLinkedList, rhs: DoublyLinkedList) -> Bool {
//        var (lhsCursor, rhsCursor) = (lhs.first, rhs.first)
//        while let lhsValue = lhsCursor?.value,
//            let rhsValue = rhsCursor?.value,
//            lhsValue == rhsValue {
//                (lhsCursor, rhsCursor) = (lhsCursor?.previous, rhsCursor?.previous)
//        }
//        return lhsCursor == nil && rhsCursor == nil
//    }
//}
//
//extension DoublyLinkedList: Sequence {
//    func makeIterator() -> DoublyLinkedListIterator<Element> {
//        return DoublyLinkedListIterator(current: self.first)
//    }
//}
//
//struct DoublyLinkedListIterator<Element>: IteratorProtocol {
//
//    var current: DoublyLinkedList<Element>.Node?
//
//    mutating func next() -> Element? {
//        let next = current
//        current = current?.previous
//        return next?.value
//    }
//}

