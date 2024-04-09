import Foundation

let n = Int(readLine()!)!

func cnt(_ n: Int) -> Int {
    if n == 1 {
        return 0
    }

    let remainder = n % 2 == 0

    if remainder {
        return cnt(n / 2) + 1
    } else {
        return cnt(n * 3 + 1) + 1
    }
}

print(cnt(n))