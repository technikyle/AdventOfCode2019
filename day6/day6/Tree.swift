//
//  Tree.swift
//  day6
//
//  Created by Kyle Rokita on 12/6/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import Foundation

class TreeNode {
    var children: [TreeNode] = []

    func addChild(_ child: TreeNode) {
        children.append(child)
    }

    func recurseTree(_ work: (TreeNode) -> ()) {
        work(self)
        for child in children {
            recurseTree(work)
        }
    }
}
