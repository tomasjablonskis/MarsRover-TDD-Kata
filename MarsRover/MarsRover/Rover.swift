//
//  Rover.swift
//  MarsRover
//
//  Created by Tomas Jablonskis on 2021-02-22.
//

import Foundation

public struct Coordinate: Equatable {
    public var x: Int
    public var y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

public class Rover {

    private(set) public var coordinate: Coordinate
    private(set) public var direction: String

    public init(coordinate: Coordinate, direction: String) {
        self.coordinate = coordinate
        self.direction = direction
    }

    public func move(command: String) {
        coordinate.y += 1
    }
}
