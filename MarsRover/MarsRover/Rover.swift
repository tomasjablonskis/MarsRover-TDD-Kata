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

    public enum Direction: Int, CaseIterable {
        case north
        case east
        case south
        case west

        mutating func next() {
            self = Direction(rawValue: rawValue + 1) ?? Direction(rawValue: 0)!
        }

        mutating func previous() {
            let allCases = Rover.Direction.allCases
            self = rawValue == 0 ? Direction(rawValue: allCases.count - 1)! : Direction(rawValue: rawValue - 1)!
        }
    }

    public enum Command: Character {
        case forward = "F"
        case backward = "B"
        case right = "R"
        case left = "L"
    }

    private(set) public var coordinate: Coordinate
    private(set) public var direction: Direction

    public init(coordinate: Coordinate, direction: Direction) {
        self.coordinate = coordinate
        self.direction = direction
    }

    public func move(commands: String) {
        commands.map(\.command).forEach { command in
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

            case (_, .right):
                direction.next()

            case (_, .left):
                direction.previous()
            }
        }
    }
}

private extension Character {
    var command: Rover.Command {
        Rover.Command(rawValue: self)!
    }
}
