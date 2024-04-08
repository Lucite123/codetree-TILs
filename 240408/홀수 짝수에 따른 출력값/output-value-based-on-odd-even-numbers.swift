import Foundation

let n = Int(readLine()!)!

func sum(_ n: Int) -> Int {
    if n < 3 {
        return n
    }

    return sum(n - 2) + n
}

print(sum(n))