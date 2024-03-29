import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let t = input[1]

let commands = readLine()!.map { String($0) }

var table = [[Int]]()

for _ in 0 ..< n {
    let row = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    table.append(row)
}

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]

var dir = 3
var x = (n - 1) / 2
var y = x
var points = 0

func turnLeft() {
    dir = ((dir - 1) + 4) % 4
}

func turnRight() {
    dir = (dir + 1) % 4
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

func foward() {
    // 범위가 넘어갈경우 무시해야
    if isValidRange(x + dxs[dir], y + dys[dir]) {
        points += table[x][y]
        x += dxs[dir]
        y += dys[dir]
    }
}

for command in commands {
    switch command {
        case "L":
            turnLeft()
        case "R":
            turnRight()
        default:
            foward() 
    }
}

points += table[x][y]
print(points)