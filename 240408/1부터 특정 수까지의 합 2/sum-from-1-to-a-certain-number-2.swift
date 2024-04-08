import Foundation

let n = Int(readLine()!)!

func sum(to n: Int) -> Int {
    if n == 1 {
        return 1
    }

    return sum(to: n - 1) + n
}

print(sum(to: n))