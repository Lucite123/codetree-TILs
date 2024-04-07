import Foundation

let n = Int(readLine()!)!

func flower(_ n: Int) {
    if n == 0 {
        return
    }

    print(n, terminator: " ")
    flower(n - 1)
    print(n, terminator: " ")
}

flower(n)