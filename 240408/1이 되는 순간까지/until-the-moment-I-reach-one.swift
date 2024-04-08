import Foundation

let n = Int(readLine()!)!

func recursive(_ n: Int) -> Int {
    if n == 1 {
        return 0
    }

    let remainder = (n % 2 == 0)

    if remainder {
        return recursive(n / 2) + 1
    } else {
        return recursive(n / 3) + 1
    }

    count += 1
}

print(recursive(n))