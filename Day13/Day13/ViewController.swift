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
        
        
        let code = [2,380,379,385,1008,2979,673982,381,1005,381,12,99,109,2980,1102,0,1,383,1101,0,0,382,20102,1,382,1,20101,0,383,2,21102,1,37,0,1106,0,578,4,382,4,383,204,1,1001,382,1,382,1007,382,45,381,1005,381,22,1001,383,1,383,1007,383,26,381,1005,381,18,1006,385,69,99,104,-1,104,0,4,386,3,384,1007,384,0,381,1005,381,94,107,0,384,381,1005,381,108,1105,1,161,107,1,392,381,1006,381,161,1101,-1,0,384,1106,0,119,1007,392,43,381,1006,381,161,1101,0,1,384,21002,392,1,1,21101,24,0,2,21102,0,1,3,21101,138,0,0,1106,0,549,1,392,384,392,21001,392,0,1,21102,24,1,2,21102,3,1,3,21102,1,161,0,1105,1,549,1101,0,0,384,20001,388,390,1,21001,389,0,2,21101,0,180,0,1106,0,578,1206,1,213,1208,1,2,381,1006,381,205,20001,388,390,1,20101,0,389,2,21102,1,205,0,1105,1,393,1002,390,-1,390,1102,1,1,384,21001,388,0,1,20001,389,391,2,21102,228,1,0,1105,1,578,1206,1,261,1208,1,2,381,1006,381,253,21001,388,0,1,20001,389,391,2,21102,253,1,0,1105,1,393,1002,391,-1,391,1101,0,1,384,1005,384,161,20001,388,390,1,20001,389,391,2,21101,279,0,0,1105,1,578,1206,1,316,1208,1,2,381,1006,381,304,20001,388,390,1,20001,389,391,2,21101,304,0,0,1106,0,393,1002,390,-1,390,1002,391,-1,391,1102,1,1,384,1005,384,161,21001,388,0,1,20101,0,389,2,21102,1,0,3,21102,1,338,0,1106,0,549,1,388,390,388,1,389,391,389,21002,388,1,1,21002,389,1,2,21101,4,0,3,21101,365,0,0,1105,1,549,1007,389,25,381,1005,381,75,104,-1,104,0,104,0,99,0,1,0,0,0,0,0,0,306,20,21,1,1,22,109,3,22101,0,-2,1,22102,1,-1,2,21101,0,0,3,21101,414,0,0,1106,0,549,21202,-2,1,1,22102,1,-1,2,21101,0,429,0,1105,1,601,2101,0,1,435,1,386,0,386,104,-1,104,0,4,386,1001,387,-1,387,1005,387,451,99,109,-3,2106,0,0,109,8,22202,-7,-6,-3,22201,-3,-5,-3,21202,-4,64,-2,2207,-3,-2,381,1005,381,492,21202,-2,-1,-1,22201,-3,-1,-3,2207,-3,-2,381,1006,381,481,21202,-4,8,-2,2207,-3,-2,381,1005,381,518,21202,-2,-1,-1,22201,-3,-1,-3,2207,-3,-2,381,1006,381,507,2207,-3,-4,381,1005,381,540,21202,-4,-1,-1,22201,-3,-1,-3,2207,-3,-4,381,1006,381,529,22101,0,-3,-7,109,-8,2105,1,0,109,4,1202,-2,45,566,201,-3,566,566,101,639,566,566,1202,-1,1,0,204,-3,204,-2,204,-1,109,-4,2105,1,0,109,3,1202,-1,45,594,201,-2,594,594,101,639,594,594,20101,0,0,-2,109,-3,2105,1,0,109,3,22102,26,-2,1,22201,1,-1,1,21102,1,587,2,21101,0,321,3,21101,1170,0,4,21101,630,0,0,1106,0,456,21201,1,1809,-2,109,-3,2105,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,2,2,0,0,0,2,2,2,0,0,0,0,2,0,0,2,2,2,0,2,0,0,2,0,2,0,2,0,2,2,0,0,2,2,0,0,0,0,0,2,0,1,1,0,2,2,0,0,0,2,0,2,2,0,2,0,2,2,0,0,2,0,0,0,2,0,0,0,0,2,0,0,0,0,0,0,0,2,0,0,2,2,2,2,0,0,1,1,0,2,0,2,2,0,0,2,2,2,2,0,2,0,2,0,0,2,0,0,0,2,0,2,2,0,2,0,0,2,2,2,0,2,0,0,0,2,0,0,0,2,0,1,1,0,2,0,0,0,2,0,0,2,0,2,0,0,0,0,2,0,2,2,0,2,0,2,0,2,0,2,0,0,0,0,2,0,0,2,0,0,2,0,0,0,0,0,1,1,0,2,0,2,0,0,0,2,0,2,2,0,0,0,2,0,0,2,0,0,0,0,2,2,2,0,0,2,0,2,2,0,2,2,0,2,0,0,0,0,2,0,0,1,1,0,2,0,2,0,0,2,0,0,0,0,0,2,0,2,0,2,0,0,0,2,0,0,2,0,0,2,0,0,0,0,2,0,2,0,0,0,2,2,0,2,0,0,1,1,0,2,0,0,0,2,0,2,2,0,0,0,0,2,0,0,2,0,0,2,0,0,0,2,0,2,0,2,0,2,0,0,0,0,2,2,2,0,0,0,0,2,0,1,1,0,2,0,2,0,2,2,0,2,2,2,2,2,0,0,0,2,0,0,2,0,0,0,0,0,0,0,2,2,2,0,2,2,0,0,0,0,0,2,0,2,2,0,1,1,0,0,0,2,2,0,2,2,2,2,0,0,2,2,0,2,0,0,2,2,0,0,2,0,2,0,2,0,0,2,0,0,0,0,0,0,0,0,0,0,2,0,0,1,1,0,2,0,2,0,2,0,2,2,2,0,0,2,2,2,2,0,0,2,2,2,0,0,0,2,0,0,2,2,2,2,2,0,2,0,2,2,0,2,2,2,2,0,1,1,0,2,0,0,0,2,0,0,0,0,0,0,2,0,2,0,0,0,0,0,0,0,0,0,2,2,2,0,0,0,2,2,0,2,0,0,0,2,0,0,2,0,0,1,1,0,2,0,2,0,2,0,2,0,2,0,2,2,2,2,0,0,0,0,2,2,0,2,0,0,2,0,0,2,0,0,0,0,2,2,2,2,0,2,2,0,2,0,1,1,0,0,0,2,2,0,0,0,0,2,2,2,0,0,0,2,2,0,2,0,0,2,2,2,2,0,2,0,0,0,0,2,0,0,0,0,2,0,2,2,2,0,0,1,1,0,2,2,0,2,0,0,0,0,0,0,2,2,0,0,2,0,0,2,2,0,2,0,0,0,0,2,2,0,2,0,2,2,0,0,0,0,0,0,2,0,0,0,1,1,0,2,0,2,2,0,0,2,0,0,2,0,2,2,2,2,2,0,2,0,0,2,2,0,2,0,2,2,0,0,0,0,2,0,2,2,0,2,0,0,0,0,0,1,1,0,0,0,0,2,2,0,2,2,2,0,0,0,0,2,0,2,2,2,0,2,0,0,2,2,0,2,0,0,0,2,0,0,0,2,2,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,2,0,0,2,0,0,0,2,0,2,0,0,0,2,0,2,2,0,0,2,0,2,0,2,2,0,2,0,0,2,0,0,2,2,0,0,1,1,0,0,2,0,0,2,0,0,2,0,0,2,2,0,0,0,0,0,2,2,0,2,2,0,0,0,0,0,2,0,0,2,2,0,0,0,2,0,0,2,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,16,49,6,70,42,11,9,96,27,54,49,26,55,46,33,78,80,33,71,39,43,60,11,91,27,20,80,62,34,64,19,4,56,17,24,21,59,6,44,87,8,82,47,82,83,9,32,84,73,89,82,14,6,66,27,27,72,34,14,41,98,57,61,48,13,9,22,15,21,76,85,28,6,58,47,62,18,62,27,71,29,87,55,16,8,87,10,93,52,81,72,52,14,53,80,97,17,10,2,19,25,55,24,93,70,43,87,23,54,34,93,83,69,30,96,65,15,87,32,64,34,32,84,72,5,48,74,44,3,30,84,23,80,60,18,85,96,35,31,47,40,98,71,34,27,5,84,81,37,39,33,25,27,92,47,57,10,9,93,95,30,97,48,82,18,46,9,86,22,14,75,18,29,20,65,11,2,81,52,11,43,64,2,91,47,55,68,36,96,37,55,32,77,65,41,27,96,97,33,73,58,4,51,78,93,52,6,90,94,19,16,57,7,85,89,67,57,38,84,61,88,24,76,72,40,74,2,79,54,49,35,61,36,27,69,25,87,89,70,39,79,72,64,73,18,23,64,54,65,8,25,18,41,87,59,19,79,89,22,43,78,87,2,12,78,68,52,51,96,79,88,72,73,79,6,59,83,62,4,55,44,16,77,81,19,19,48,17,51,64,59,59,19,64,48,28,71,70,57,41,52,15,70,45,25,51,30,6,14,82,20,20,11,71,81,82,39,90,33,34,86,48,68,29,54,32,48,22,79,35,82,81,86,83,49,71,46,75,25,81,50,18,88,97,60,64,26,12,92,3,81,58,10,21,5,65,80,20,80,38,21,42,13,35,49,81,35,82,38,26,84,41,3,52,70,41,65,61,47,55,60,12,16,52,15,3,51,11,12,5,19,51,24,54,24,2,13,3,98,1,86,55,67,4,87,34,81,29,65,6,60,88,77,19,67,37,33,29,35,42,71,74,11,81,95,89,93,55,35,60,43,65,40,85,97,26,87,97,51,44,22,35,52,30,24,29,78,73,75,62,46,38,44,62,20,2,2,67,60,44,80,71,25,63,84,31,36,89,80,91,64,5,3,84,28,31,36,56,35,69,17,85,85,97,6,21,15,10,21,97,20,68,83,12,51,13,91,76,44,50,89,92,77,15,33,85,91,89,71,13,41,36,55,51,1,15,48,52,23,13,31,80,73,98,17,36,52,32,88,59,28,29,86,9,56,30,21,66,98,81,69,25,82,61,86,7,68,62,71,57,9,36,54,53,71,82,21,88,87,94,80,5,29,48,12,23,78,16,30,10,13,53,90,64,30,90,50,89,61,43,20,5,33,45,28,21,77,61,77,28,73,34,35,8,1,47,18,29,95,47,88,34,46,31,31,67,74,16,40,75,88,91,53,55,86,64,22,94,87,91,43,3,14,48,94,68,91,4,49,50,50,4,35,1,90,25,36,90,18,11,17,14,96,55,17,88,24,15,97,80,70,41,81,8,67,41,90,29,29,72,94,69,84,29,34,33,37,51,66,22,35,87,17,84,86,75,30,8,38,1,80,9,84,7,62,84,14,85,58,43,50,19,1,87,97,75,38,33,57,80,93,38,95,48,84,86,67,57,10,27,45,33,94,13,37,71,96,29,63,82,86,14,46,76,15,93,34,47,60,27,2,1,21,93,15,34,62,96,56,90,5,68,73,71,80,75,52,13,49,38,51,76,60,54,29,96,5,28,98,13,78,53,16,49,52,63,43,37,88,86,3,56,96,21,78,92,97,10,66,86,36,9,6,39,59,57,83,51,76,50,58,52,8,4,11,44,73,85,62,6,35,96,86,53,13,32,22,49,72,44,94,14,95,75,55,28,36,2,33,86,73,62,44,59,84,55,4,36,7,79,10,49,49,80,26,3,22,44,87,63,60,26,13,86,11,27,64,80,81,95,77,80,39,41,81,15,81,76,37,42,41,26,51,43,88,76,82,25,55,94,37,75,11,65,44,97,78,56,66,23,50,76,6,28,75,63,16,91,15,79,47,41,73,36,2,77,79,77,73,11,36,37,1,31,76,82,74,68,50,35,48,72,71,72,90,41,66,65,90,82,48,49,21,54,74,57,24,9,29,2,6,9,51,52,77,80,33,34,8,89,77,16,19,78,22,30,18,74,98,45,31,28,29,91,67,16,51,75,94,90,51,75,80,8,18,66,89,44,24,20,31,59,12,89,52,33,58,59,94,89,91,84,95,8,59,67,13,19,84,28,89,22,39,6,90,3,10,84,98,25,22,9,91,27,74,76,85,45,37,27,58,17,92,92,31,24,44,89,68,12,82,23,36,7,18,71,43,46,17,5,94,14,83,32,67,7,76,95,20,53,8,18,68,89,58,60,40,75,70,38,38,38,14,39,39,37,73,81,2,45,18,80,13,8,86,31,74,21,4,75,51,26,30,52,50,65,37,81,29,14,76,83,78,79,48,52,73,36,15,82,55,47,76,54,29,10,75,50,85,68,39,78,34,69,16,14,49,27,12,15,17,17,66,42,18,40,17,98,7,15,94,93,36,17,44,45,57,20,78,24,33,48,68,52,49,52,95,19,63,59,4,40,4,38,78,5,84,55,40,88,74,48,85,24,30,18,12,2,30,13,98,3,93,65,63,53,23,7,37,63,673982]
        
        //        45 wide, 26 tall

        displayMap = [[String]].init(repeating: [String].init(repeating: " ", count: 45), count: 26)
        
        view.addSubview(label)
        view.addConstraint(label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40.0))
        view.addConstraint(label.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        view.addSubview(leftButton)
        view.addConstraint(leftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(leftButton.leftAnchor.constraint(equalTo: view.leftAnchor))
        view.addConstraint(leftButton.heightAnchor.constraint(equalToConstant: 50.0))
        
        view.addSubview(rightButton)
        view.addConstraint(rightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        view.addConstraint(rightButton.rightAnchor.constraint(equalTo: view.rightAnchor))
        view.addConstraint(leftButton.rightAnchor.constraint(equalTo: rightButton.leftAnchor, constant: 20.0))
        view.addConstraint(leftButton.heightAnchor.constraint(equalTo: rightButton.heightAnchor))
        
        view.addSubview(scoreLabel)
        view.addConstraint((scoreLabel).topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30))
        view.addConstraint((scoreLabel).centerXAnchor.constraint(equalTo: view.centerXAnchor))
                
        addKeyCommand(UIKeyCommand(input: UIKeyCommand.inputLeftArrow, modifierFlags: [], action: #selector(leftPressed)))
        addKeyCommand(UIKeyCommand(input: UIKeyCommand.inputRightArrow, modifierFlags: [], action: #selector(rightPressed)))
        
        //        - (BOOL)canBecomeFirstResponder
        //    {
        //    return YES;
        //    }
        //
        //    - (NSArray *)keyCommands
        //    {
        //    return @[ [UIKeyCommand keyCommandWithInput:@"\r" modifierFlags:0 action:@selector(enterPressed)] ];
        //    }"
        
        updateScoreLabel(score: 0)
        
        program = IntCodeProgram(code: code, delegate: self, id: 0)
        
        run()
        
        
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @objc func leftPressed() {
        pressed = -1
        startTimer()
    }
    
    @objc func rightPressed() {
        pressed = 1
        startTimer()
    }
    
    var pressed: Int = 0
    
    var timer: Timer?
    
    func startTimer() {
        cancelTimer()
        
        timer = Timer.scheduledTimer(withTimeInterval:0.05, repeats: false, block: { time in
            self.pressed = 0
        })
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier", size: 12.0)
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    var program: IntCodeProgram!
        
    enum TileId: Int {
        case empty, wall, block, horizontalPaddle, ball
    }
    
    func updateScoreLabel(score: Int) {
        scoreLabel.text = "Score: \(score)"
    }
    
    func stringFor(tileId: TileId) -> String {
        switch tileId {
            case .ball:
                return "O"
            case .block:
                return "X"
            case .empty:
                return " "
            case .horizontalPaddle:
                return "-"
            case .wall:
                return "="
        }
    }
    
    var map: [Position: TileId] = [:] {
        didSet {
            for (key, value) in map {
                let position = key

                let string = stringFor(tileId: value)
                displayMap[position.y][position.x] = string
//                if string == "-" {
//                    displayMap[position.1][position.0 - 1] = string
//                    displayMap[position.1][position.0 + 1] = string
//                }
                
                let index = displayTextStartIndexes[position.y * (45 + 1) + position.x]
                self.displayText = displayText.replacingCharacters(in: (index...index), with: string)
            }
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
    
    var displayMap: [[String]] = [] {
        didSet {
//            var text: String = ""
//            for row in displayMap {
//                text += row.joined()
//                text += "\n"
//            }
//            label.text = text
        }
    }
    var displayText = (0..<26).map { _ in String.init(repeating: " ", count: 45) }.joined(separator: "\n") {
        didSet {
            label.text = displayText
        }
    }
    
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    
    func run() {
//        program.inputs.append(mapColor)
        program.run()
    }
    
    func completed(program: IntCodeProgram) {
        //        print(map.count)
        
    }
    
    func willReadInputs(program: IntCodeProgram) {
        print(self.pressed)
        let ballPosition = positionOf(text: stringFor(tileId: .ball))
        var direction = 1
        if let lastBallPosition = lastBallPosition {
            direction = ballPosition.0 - lastBallPosition.0
            direction = min(direction, 1)
            direction = max(direction, -1)

        }
        lastBallPosition = ballPosition
        let paddlePosition = positionOf(text: stringFor(tileId: .horizontalPaddle))
        if abs(ballPosition.1 - paddlePosition.1) <= 1 {
            direction = 0
        }
        var xDifference = ballPosition.0 - paddlePosition.0 + direction
        xDifference = min(xDifference, 1)
        xDifference = max(xDifference, -1)

        self.pressed = xDifference
        program.inputs.append(self.pressed) // resetting
    }
    
    var lastBallPosition: (Int, Int)?
    
    func positionOf(text: String) -> (Int, Int) {
        for (yIndex, row) in displayMap.enumerated() {
            for (xIndex, value) in row.enumerated() {
                if value == text {
                    return (xIndex, yIndex)
                }
            }
        }
        assertionFailure()
        return (-1, -1)
    }
    
    var delayNanoSeconds = 1
    
    func outputsChanged(outputs: [Int], program: IntCodeProgram) {
        guard outputs.count % 3 == 0 else { return }
        
        let x = outputs[outputs.count - 3]
        let y = outputs[outputs.count - 2]
        
        defer {
            program.paused = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .nanoseconds(delayNanoSeconds), execute: {
                self.run()
            })
        }
        
        if x == -1 && y == 0 {
            let score = outputs[outputs.count - 1]
            updateScoreLabel(score: score)
            delayNanoSeconds = 10_000
            return
        }
        
        let tileId = TileId(rawValue: outputs[outputs.count - 1])!
        
        map[Position(x:x,y:y)] = tileId
    }
    
    lazy var leftButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("left", for: .normal)
        button.backgroundColor = UIColor.green
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("right", for: .normal)
        button.backgroundColor = UIColor.green
        return button
    }()
        
}



protocol IntCodeProgramDelegate {
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
                    delegate.willReadInputs(program: self)
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
