import Foundation

let n = Int(readLine()!)!

var map = [[String]]()

for _ in 0 ..< n {
    let row = readLine()!.map { String($0) }
    map.append(row)
}

let k = Int(readLine()!)!

enum Direction {
    case up
    case left 
    case right
    case down
}

struct Position {
    let x: Int
    let y: Int
}

// 이전 좌표랑 비교해서 다음 방향을 구하는 함수
func mapDirection(_ current: Position, _ next: Position) -> Direction {
    if current.x == next.x {
        if current.y < next.y {
            return .left
        } else {
            return .right
        }
    } else {
        if current.x < next.x {
            return .up
        } else {
            return .down
        }
    }
}

func getNextDirection(_ mirror: String, _ direction: Direction) -> Int {
    if mirror == "/" {
        switch direction {
            case .up, .down:
                return 1
            case .left, .right:
                return -1
        }
    } else {
        switch direction {
            case .up, .down:
                return -1
            case .left, .right:
                return 1
        }
    }
}

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]

var dir = 0
var position: Position

func isValidRange(_ position: Position) -> Bool {
    return (0 <= position.x && position.x <= n - 1) && (0 <= position.y && position.y <= n - 1)
}

func getFirstDirection(_ k: Int) -> Direction {
    if k > 3 * n && k <= 4 * n {
        return .left
    } else if k > 2 * n && k <= 3 * n {
        return .down
    } else if k > n && k <= 2 * n {
        return .right
    } else {
        return .up
    }
}

func getFirstPosition(_ k: Int) -> Position {
    if k > 3 * n && k <= 4 * n {
        // print("hi")
        return Position(x: (4 * n) - k , y: 0)
    } else if k > 2 * n && k <= 3 * n {
        // print("he")
        return Position(x: n - 1, y: (((3 * n) + 1) - k) - 1)
    } else if k > n && k <= 2 * n {
        // print("ho")
        return Position(x: ((k - n) - 1) , y: n - 1)
    } else {
        // print("ne")
        return Position(x: 0, y: k - 1)
    }
}

var count = 1

let firstDirectionMapper: [Direction: Int] = [
    .down: 3,
    .right: 2,
    .left: 0,
    .up: 1
]

func start(_ k: Int) {
    
    var position = getFirstPosition(k)
    let firstPosition = position
    // print(position)
    // print(map[position.x][position.y])
    var direction = getFirstDirection(k)
    // print(direction)
    var dir = firstDirectionMapper[direction]!
    // print(dir)

    if map[position.x][position.y] == "/" {
        switch direction {
            case .down, .up:
                dir = (dir + 1)  % 4
            case .right, .left:
                dir = ((dir - 1) + 4) % 4
        }
    } else {
        switch direction {
            case .down, .up:
                dir = ((dir - 1) + 4) % 4
            case .right, .left:
                dir = (dir + 1)  % 4
        }
    }

    if isValidRange(Position(x: position.x + dxs[dir], y: position.y + dys[dir])) == false {
        return
    }

    position = Position(x: position.x + dxs[dir], y: position.y + dys[dir])
    direction = mapDirection(firstPosition, position)
    count += 1
    // print(firstPosition, position)

    while isValidRange(position) {
        let mirror = map[position.x][position.y]
        // print(direction)
        if (dir + getNextDirection(mirror, direction)) < 0 {
            dir = (dir + getNextDirection(mirror, direction) + 4) % 4
        } else {
            dir = (dir + getNextDirection(mirror, direction)) % 4
            // print("gi")
        }

        // print(position)
        let nextPosition = Position(x: position.x + dxs[dir], y: position.y + dys[dir])
        // print(nextPosition)
        // print(dir)

        if isValidRange(nextPosition) == false {
            return
        }
        direction = mapDirection(position, nextPosition)
        position = nextPosition
        count += 1
    }
}

start(k)
print(count)