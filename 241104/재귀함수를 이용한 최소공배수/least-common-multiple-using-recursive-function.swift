import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }

func gcd(_ lhs: Int, _ rhs: Int) -> Int {
    var divisor = 1
    var current = 1

    while true {
        if current > min(lhs, rhs) {
            break
        }

        if lhs % current == 0 && rhs % current == 0 {
            divisor = current
        }

        current += 1
    }

    return divisor
}


func lcs(_ lhs: Int, _ rhs: Int) -> Int {
    let lcs = (lhs * rhs) / gcd(lhs, rhs)
    return lcs
}

var result = 0

func execute(_ n: Int) {
    if n < 1 {
        result = numbers[0]
        return
    }

    execute(n - 1)
    result = lcs(result, numbers[n])
}

execute(n - 1)
print(result)