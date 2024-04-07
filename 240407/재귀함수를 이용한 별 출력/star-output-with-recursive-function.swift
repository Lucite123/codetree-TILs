import Foundation

let n = Int(readLine()!)!

func printStar(_ n: Int) {
    if n == 0 {
        return
    }

    printStar(n - 1)
    for _ in 0 ..< n {
        print("*", terminator: "")
    }
    print()
}

printStar(n)