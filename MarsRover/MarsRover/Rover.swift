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

public struct Grid {
    let topRightCoordinate: Coordinate

    public init(topRightCoordinate: Coordinate) {
        self.topRightCoordinate = topRightCoordinate
    }

    public var xEdge: Int {
        topRightCoordinate.x
    }

    public var yEdge: Int {
        topRightCoordinate.y
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
    private let grid: Grid

    private enum Error: Swift.Error {
        case initialCoordinateOutOfBounds
    }

    public init(coordinate: Coordinate, direction: Direction, grid: Grid) throws {
        self.coordinate = coordinate
        self.direction = direction
        self.grid = grid

        if isOutOfBounds() {
            throw Error.initialCoordinateOutOfBounds
        }
    }

    public func move(commands: String) {
        commands.map(\.command).forEach { command in
            switch (direction, command) {
            case (.north, .forward),
                 (.south, .backward):
                coordinate.y += 1

                if coordinate.y > grid.yEdge {
                    coordinate.y = 0
                }

            case (.north, .backward),
                 (.south, .forward):
                coordinate.y -= 1

                if coordinate.y < 0 {
                    coordinate.y = grid.yEdge
                }

            case (.east, .forward),
                 (.west, .backward):
                coordinate.x += 1

                if coordinate.x > grid.xEdge {
                    coordinate.x = 0
                }

            case (.east, .backward),
                 (.west, .forward):
                coordinate.x -= 1

                if coordinate.x < 0 {
                    coordinate.x = grid.xEdge
                }

            case (_, .right):
                direction.next()

            case (_, .left):
                direction.previous()
            }
        }
    }

    private func isOutOfBounds() -> Bool {
        coordinate.x < 0 || coordinate.y < 0 || coordinate.x > grid.xEdge || coordinate.y > grid.yEdge
    }
}

private extension Character {
    var command: Rover.Command {
        Rover.Command(rawValue: self)!
    }
}
