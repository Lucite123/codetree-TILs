import Foundation

let n = Int(readLine()!)!

var count = 0

func recursive(_ n: Int) {
    if n == 1 {
        return
    }

    let remainder = (n % 2 == 0)

    if remainder {
        recursive(n / 2)
    } else {
        recursive(n / 3)
    }

    count += 1
}

recursive(n)
print(count)