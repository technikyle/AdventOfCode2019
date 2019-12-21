//
//  ViewController.swift
//  Day14
//
//  Created by Kyle Rokita on 12/17/19.
//  Copyright © 2019 Kyle Rokita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var oreId = { intForText(text: "ORE") }()
    lazy var fuelId = { intForText(text: "FUEL") }()
    
    var nameCount = 0
    var nameToIntMap = [String: Int]()
    
    func intForText(text:String) -> Int {
        if let number = nameToIntMap[text] {
            return number
        }
        nameToIntMap[text] = nameCount
        nameCount += 1
        return nameToIntMap[text]!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = """
                    2 RWPCH => 9 PVTL
                    1 FHFH => 4 BLPJK
                    146 ORE => 5 VJNBT
                    8 KDFNZ, 1 ZJGH, 1 GSCG => 5 LKPQG
                    11 NWDZ, 2 WBQR, 1 VRQR => 2 BMJR
                    3 GSCG => 4 KQDVM
                    5 QVNKN, 6 RPWKC => 3 BCNV
                    10 QMBM, 4 RBXB, 2 VRQR => 1 JHXBM
                    15 RPWKC => 6 MGCQ
                    1 QWKRZ => 4 FHFH
                    10 RWPCH => 6 MZKG
                    11 JFKGV, 5 QVNKN, 1 CTVK => 4 VQDT
                    1 SXKT => 5 RPWKC
                    1 VQDT, 25 ZVMCB => 2 RBXB
                    6 LGLNV, 4 XSNKB => 3 WBQR
                    199 ORE => 2 SXKT
                    1 XSNKB, 6 CWBNX, 1 HPKB, 5 PVTL, 1 JNKH, 9 SXKT, 3 KQDVM => 3 ZKTX
                    7 FDSX => 6 WJDF
                    7 JLRM => 4 CWBNX
                    167 ORE => 5 PQZXH
                    13 JHXBM, 2 NWDZ, 4 RFLX, 12 VRQR, 10 FJRFG, 14 PVTL, 2 JLRM => 6 DGFG
                    12 HPKB, 3 WHVXC => 9 ZJGH
                    1 JLRM, 2 ZJGH, 2 QVNKN => 9 FJRFG
                    129 ORE => 7 KZFPJ
                    2 QMBM => 1 RWPCH
                    7 VJMWM => 4 JHDW
                    7 PQZXH, 7 SXKT => 9 BJVQM
                    1 VJMWM, 4 JHDW, 1 MQXF => 7 FDSX
                    1 RPWKC => 7 WHVXC
                    1 ZJGH => 1 ZVMCB
                    1 RWPCH => 3 MPKR
                    187 ORE => 8 VJMWM
                    15 CTVK => 5 GSCG
                    2 XSNKB, 15 ZVMCB, 3 KDFNZ => 2 RFLX
                    18 QVNKN => 8 XLFZJ
                    4 CWBNX => 8 ZSCX
                    2 ZJGH, 1 JLRM, 1 MGCQ => 9 NPRST
                    13 BJVQM, 2 BCNV => 2 QWKRZ
                    2 QWKRZ, 2 BLPJK, 5 XSNKB => 2 VRQR
                    13 HPKB, 3 VQDT => 9 JLRM
                    2 SXKT, 1 VJNBT, 5 VLWQB => 6 CTVK
                    2 MPKR, 2 LMNCH, 24 VRQR => 8 DZFNW
                    2 VQDT => 1 KDFNZ
                    1 CTVK, 6 FDSX => 6 QVNKN
                    3 CTVK, 1 QVNKN => 4 HPKB
                    3 NPRST, 1 KGSDJ, 1 CTVK => 2 QMBM
                    4 KZFPJ, 1 PQZXH => 5 VLWQB
                    2 VQDT => 7 KGSDJ
                    3 MPKR => 2 JNKH
                    1 KQDVM => 5 XQBS
                    3 ZKGMX, 1 XQBS, 11 MZKG, 11 NPRST, 1 DZFNW, 5 VQDT, 2 FHFH => 6 JQNF
                    2 FJRFG, 17 BMJR, 3 BJVQM, 55 JQNF, 8 DGFG, 13 ZJGH, 29 ZKTX => 1 FUEL
                    27 KZFPJ, 5 VJNBT => 5 MQXF
                    11 FDSX, 1 WHVXC, 1 WJDF => 4 ZKGMX
                    1 ZVMCB => 4 NWDZ
                    1 XLFZJ => 6 LGLNV
                    13 ZSCX, 4 XLFZJ => 8 LMNCH
                    1 RPWKC, 1 FDSX, 2 BJVQM => 8 JFKGV
                    1 WJDF, 1 LKPQG => 4 XSNKB
                    """
        
        func resourceReqs(half: String) -> [ResourceReq] {
            var resourceReqs = [ResourceReq]()
            for reqs in half.split(separator: ",") {
                let reqString = String(reqs)
                
                var resourceReq = ResourceReq()
                for (index, item) in reqString.split(separator: " ").enumerated() {
                    let itemString = item
                    if index == 0 {
                        resourceReq.count = Int(itemString)!
                    }
                    else {
                        resourceReq.resource = intForText(text: String(itemString))
                    }
                }
                resourceReqs.append(resourceReq)
            }
            return resourceReqs
        }

        for row in input.split(separator: "\n") {
            let rowString = String(row)
            let index = rowString.firstIndex(of: "=")!
            let half1 = String(rowString[rowString.startIndex..<index])
            let half1Resources = resourceReqs(half: half1)
            
            let arrowIndex = rowString.index(index, offsetBy: 2)
            let half2 = String(rowString[arrowIndex..<rowString.endIndex])
            let half2Resources = resourceReqs(half: half2)

            let half2Resource = half2Resources.first!
            resourceMapping[half2Resource.resource] = ResourceMappingValue(count: half2Resource.count, reqs: half1Resources)
        }
        
        runOnce()

        let trillion = 1_000_000_000_000
        
//        let atLeast = trillion / oreCount
//        fuels += atLeast - 1
//        oreCount *= atLeast
//
//        var newMap = [String: Int]()
//        for (key, value) in extraReq {
//            newMap[key] = value * atLeast
//        }
//        extraReq = newMap
//
        while oreCount < trillion {
            runOnce()
            if oreCount % 10_000 == 0 {
                print(Double(oreCount) / Double(trillion))
            }
        }

        print(fuels)
    }

    var oreCount = 0

    var extraReq = [Int].init(repeating: 0, count: 1000)
    
    var fuels = 0
    
    var dependencyQueue = [ResourceReq].init(repeating: ResourceReq(), count: 10000)
        
    func runOnce() {
        var dependencyQueueIndex = 0
        var dependencyQueueCount = 0

        dependencyQueue[0] = ResourceReq(resource: fuelId, count: resourceMapping[fuelId].count)
        dependencyQueueCount += 1
        
        while dependencyQueueIndex < dependencyQueueCount {
            let req = dependencyQueue[dependencyQueueIndex]
            dependencyQueueIndex += 1
            
            var reqCount = req.count
            // 1
            
            func getExtraIfPossibe(resource: Int, needed: Int) -> Int {
                let extra = extraReq[req.resource]
                let used = min(extra, needed)
                extraReq[req.resource] = extra - used
                return used
            }
            
            // check for extra
            reqCount -= getExtraIfPossibe(resource: req.resource, needed: reqCount)
            
            guard reqCount > 0 else { continue }
            
            let dependencies = resourceMapping[req.resource].reqs
            let reqNeeded = resourceMapping[req.resource].count
            
            let reqMultiplier =  Int(ceil(Double(reqCount) / Double(reqNeeded)))
            
            for dependency in dependencies {
                
                
                let depCount = reqMultiplier * dependency.count
                // 7
                
                if dependency.resource == oreId {
                    oreCount += depCount
                }
                else {
                    let nextDependency = ResourceReq(resource: dependency.resource, count: depCount)
                    dependencyQueue[dependencyQueueCount] = nextDependency
                    dependencyQueueCount += 1
                }
            }
            
            let producedResource = reqMultiplier * reqNeeded
            let extra = producedResource - reqCount
            extraReq[req.resource] = (extraReq[req.resource] ?? 0) + extra
            
        }
        
        fuels += 1

    }
    
    struct ResourceReq {
        var resource: Int = 0
        var count: Int = 0
    }

    struct ResourceMappingValue {
        var count: Int = 0
        var reqs: [ResourceReq] = []
    }
    var resourceMapping: [ResourceMappingValue] = [ResourceMappingValue].init(repeating: ResourceMappingValue(), count: 1000)

}

