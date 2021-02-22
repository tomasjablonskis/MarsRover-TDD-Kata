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

    public enum Direction {
        case north
        case south
        case east
        case west
    }

    public enum Command: Character {
        case forward = "F"
        case backward = "B"
    }

    private(set) public var coordinate: Coordinate
    private(set) public var direction: Direction

    public init(coordinate: Coordinate, direction: Direction) {
        self.coordinate = coordinate
        self.direction = direction
    }

    public func move(command: String) {
        command.map(\.command).forEach { command in
            switch (direction, command) {
            case (.north, .forward):
                coordinate.y += 1
            case (.north, .backward):
                coordinate.y -= 1

            case (.south, .forward):
                coordinate.y -= 1
            case (.south, .backward):
                coordinate.y += 1

            case (.east, .forward):
                coordinate.x += 1
            case (.east, .backward):
                coordinate.x -= 1

            case (.west, .forward):
                coordinate.x -= 1
            case (.west, .backward):
                coordinate.x += 1
                
            }
        }
    }
}

private extension Character {
    var command: Rover.Command {
        Rover.Command(rawValue: self)!
    }
}
