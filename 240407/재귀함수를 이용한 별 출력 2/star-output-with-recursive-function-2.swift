import Foundation

let n = Int(readLine()!)!

func printStar(_ n: Int) {
    for _ in 0 ..< n {
        print("*", terminator: " ")
    }
    print()
}

func recursiveStar(_ n: Int) {
    if n == 0 {
        return
    }

    printStar(n)
    recursiveStar(n - 1)
    printStar(n)
}

recursiveStar(n)