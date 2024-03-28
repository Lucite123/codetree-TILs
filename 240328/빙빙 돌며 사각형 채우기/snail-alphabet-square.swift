import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var map = [[String]]()

for _ in 0..<n {
    var row = [String]()
    for _ in 0..<m {
        row.append("0")
    }
    map.append(row)
}

let dxs = [0, 1, 0, -1]
let dys = [1, 0, -1, 0]
var dir = 0
let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var alphabetIndex = 0

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= m - 1)
}

var x = 0
var y = 0
for _ in 0 ..< m * n {
    if (isValidRange(x + dxs[dir], y + dys[dir]) && map[x + dxs[dir]][y + dys[dir]] == "0") == false {
        dir = (dir + 1) % 4
    }
    map[x][y] = alphabet[alphabetIndex]
    alphabetIndex = (alphabetIndex + 1) % alphabet.count
    x += dxs[dir]
    y += dys[dir]
}

for row in map {
    print(row.joined(separator: " "))
}