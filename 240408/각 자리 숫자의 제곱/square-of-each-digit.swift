import Foundation

let n = Int(readLine()!)!

func summarize(_ n: Int) -> Int {
    if n < 10 {
        return n * n
    }

    let lessThanTen = n % 10
    return summarize(n / 10) + lessThanTen * lessThanTen
}

print(summarize(n))