import Foundation

let n = Int(readLine()!)!

func findNthNumber(_ n: Int) -> Int {
    if n < 3 {
        return n
    }

    return findNthNumber(n / 3) + findNthNumber(n - 1)
}

print(findNthNumber(n))