import Foundation

let n = Int(readLine()!)!

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]

var x = n - 1
var y = n - 1

var table = [[Int]]()

for _ in 0 ..< n {
    var row = [Int]()

    for _ in 0 ..< n {
        row.append(0)
    }

    table.append(row)
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

var dir = 2
for number in 1 ... n * n {
    table[x][y] = (n * n) - number + 1
    if (isValidRange(x + dxs[dir], y + dys[dir]) && table[x + dxs[dir]][y + dys[dir]] == 0) == false {
        dir = (dir + 1) % 4
    }
    x += dxs[dir]
    y += dys[dir]
}

for row in table {
    let rowString = row.map { String($0) }
    print(rowString.joined(separator: " "))
}