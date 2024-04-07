import Foundation

let n = Int(readLine()!)!

func increase(_ n: Int) {
    if n == 0 {
        return
    }

    increase(n - 1)
    print(n, terminator: " ")
}

func decrease(_ n: Int) {
    if n == 0 {
        return
    }

    print(n, terminator: " ")
    decrease(n - 1)
}

increase(n)
print()
decrease(n)