import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]


func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= m - 1) && (map[x][y] == false)
}

var map = [[Bool]]()

for _ in 0 ..< n {
    var row = [Bool]()

    for _ in 0 ..< m {
        row.append(false)
    }

    map.append(row)
}

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]

var dir = 1
var x = 0
var y = 0

var resultMap = [[Int]]()

for _ in 0 ..< n {
    var row = [Int]()
    for _ in 0 ..< m {
        row.append(0)
    }
    resultMap.append(row)
}

map[x][y] = true

resultMap[x][y] = 1




for count in 2 ... n * m {
    let nextX = x + dxs[dir]
    let nextY = y + dys[dir]
    
    if isValidRange(nextX, nextY) {
        x = nextX
        y = nextY
    } else {
        dir = ((dir - 1) + 4) % 4
        x += dxs[dir]
        y += dys[dir]
    }

    resultMap[x][y] = count
    map[x][y] = true
}

for result in resultMap {
    let resultString = result.map { String($0) }
    print(resultString.joined(separator: " "))
}