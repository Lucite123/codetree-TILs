import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var table = Array(repeating: Array(repeating: false, count: n), count: n)

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (0 <= x && x <= n - 1) && (0 <= y && y <= n - 1)
}

func isComportZone(_ x: Int, _ y: Int) -> Bool {
    let dxs = [0, 1, 0, -1]
    let dys = [1, 0, -1, 0]
    var count = 0

    for dir in 0 ..< 4 {
        if isValidRange(x + dxs[dir], y + dys[dir]) {
            if table[x + dxs[dir]][y + dys[dir]] == true {
                count += 1
            }
        }
    }
    return count == 3
}

for _ in 0 ..< m {
    let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    let x = input[0] - 1
    let y = input[1] - 1

    table[x][y] = true

    if isComportZone(x, y) {
        print(1)
    } else {
        print(0)
    }
}