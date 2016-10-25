//
//  CairoTests.swift
//  Cairo
//
//  Created by Alsey Coleman Miller on 5/7/16.
//  Copyright © 2016 PureSwift. All rights reserved.
//

import XCTest
@testable import Cairo

final class CairoTests: XCTestCase {
    
    func testSourceX() {
        
        // write original
        
        let filename = outputDirectory + "sourceX.png"
        
        CairoTest.sourceX(filename)
        
        print("Wrote original to \(filename)")
        
        // write swift copy
        
        let testFilename = outputDirectory + "sourceXTest.png"
        
        let surface = Surface(format: .argb32, width: 120, height: 120)
        
        let context = Cairo.Context(surface: surface)
        
        // Examples are in 1.0 x 1.0 coordinate space
        context.scale(x: 120, y: 120)
        
        // Drawing code goes here
        context.setSource((red: 0, green: 0, blue: 0))
        context.move(to: (x: 0, y: 0))
        context.line(to: (x: 1, y: 1))
        context.move(to: (x: 1, y: 0))
        context.line(to: (x: 0, y: 1))
        context.lineWidth = 0.2
        context.stroke()
        
        context.addRectangle(x: 0, y: 0, width: 0.5, height: 0.5)
        context.setSource((red: 1, green: 0, blue: 0, alpha: 0.8))
        context.fill()
        
        context.addRectangle(x: 0, y: 0.5, width: 0.5, height: 0.5)
        context.setSource((red: 0, green: 1, blue: 0, alpha: 0.6))
        context.fill()
        
        context.addRectangle(x: 0.5, y: 0, width: 0.5, height: 0.5)
        context.setSource((red: 0, green: 0, blue: 1, alpha: 0.4))
        context.fill()
        
        surface.writePNG(to: testFilename)
        
        print("Wrote test to \(testFilename)")
        
        let fileData = try? Data(contentsOf: URL(fileURLWithPath: filename))
        let testFileData = try? Data(contentsOf: URL(fileURLWithPath: testFilename))
        
        XCTAssert(fileData == testFileData)
    }
}

let outputDirectory: String = {
   
    let outputDirectory = NSTemporaryDirectory() + "CairoSwiftTest" + "/"
    
    var isDirectory: ObjCBool = false
    
    if FileManager.default.fileExists(atPath: outputDirectory, isDirectory: &isDirectory) == false {
        
        try! FileManager.default.createDirectory(atPath: outputDirectory, withIntermediateDirectories: false)
    }
    
    return outputDirectory
}()
