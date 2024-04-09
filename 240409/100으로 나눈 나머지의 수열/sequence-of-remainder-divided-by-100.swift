import Foundation

let n = Int(readLine()!)!

func findNumber(_ n: Int) -> Int {
    if n == 1 {
        return 2
    } else if n == 2 {
        return 4
    }

    return findNumber(n - 1) * findNumber(n - 2) % 100
}

print(findNumber(n))