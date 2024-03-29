import Foundation

let n = Int(readLine()!)!

var table = [[String]]()

for _ in 0 ..< n {
    var row = [String]()
    for _ in 0 ..< n {
        row.append("0")
    }

    table.append(row)
}

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]



var x = (n - 1) / 2
var y = (n - 1) / 2
var moveNumber = 0
var targetMoveNumber = 0
var dir = 0

var number = 1

if n == 1 {
    print(1)
    exit(0)
}

while number <= n * n {

    while moveNumber >= 0 {
        if (number > n * n) {
            break
        }

        table[x][y] = String(number)

        if (isValidRange(x + dxs[dir], y + dys[dir]) == false) {
            break
        }
        x += dxs[dir]
        y += dys[dir]
        number += 1
        moveNumber -= 1
    }

    

    // print(table)

    dir = ((dir - 1) + 4) % 4
    if dir == 0 || dir == 2 {
        targetMoveNumber += 1
    }
    moveNumber = targetMoveNumber
}


for row in table {
    print(row.joined(separator: " "))
}