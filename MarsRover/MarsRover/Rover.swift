//
//  Rover.swift
//  MarsRover
//
//  Created by Tomas Jablonskis on 2021-02-22.
//

import Foundation

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

    public func move(commands: String, onObstacleFound: @escaping (_ obstacle: Coordinate) -> Void = { _ in }) {
        commands.map(\.command).forEach { command in

            var temp = coordinate

            switch (direction, command) {
            case (.north, .forward),
                 (.south, .backward):
                temp.y += 1

                if temp.y > grid.yEdge {
                    temp.y = 0
                }

            case (.north, .backward),
                 (.south, .forward):
                temp.y -= 1

                if temp.y < 0 {
                    temp.y = grid.yEdge
                }

            case (.east, .forward),
                 (.west, .backward):
                temp.x += 1

                if temp.x > grid.xEdge {
                    temp.x = 0
                }

            case (.east, .backward),
                 (.west, .forward):
                temp.x -= 1

                if temp.x < 0 {
                    temp.x = grid.xEdge
                }

            case (_, .right):
                direction.next()

            case (_, .left):
                direction.previous()
            }

            if grid.isObstacle(inCoordinate: temp) {
                onObstacleFound(temp)
                print("Obstacle detected at: \(temp)")
                return
            }

            self.coordinate = temp
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
