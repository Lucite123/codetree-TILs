import Foundation

let n = Int(readLine()!)!

func fibonacchi(_ n: Int) -> Int {
    if n < 3 {
        return 1
    }

    return  fibonacchi(n - 1) + fibonacchi(n - 2)
}

print(fibonacchi(n))