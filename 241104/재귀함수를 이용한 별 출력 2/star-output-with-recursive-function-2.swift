import Foundation
let n = Int(readLine()!)!

func printStar(_ n: Int) {
    if n <= 0 {
        return
    }

    var stars: [String] = []
    for _ in 0 ..< n {
        stars.append("*")
    }
    print(stars.joined(separator: " "))
    printStar(n - 1)
    stars = []
    for _ in 0 ..< n {
        stars.append("*")
    }
    print(stars.joined(separator: " "))
    
}

printStar(n)