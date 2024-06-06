import Foundation

let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

func lcs(_ n: Int, _ m: Int) -> Int {
    let pivot = min(n, m)
    let target = max(n, m)
    var pivotTimes: Set<Int> = Set<Int>()
    var currentTimes = 1
    while pivot * currentTimes <= n * m {
        pivotTimes.insert(pivot * currentTimes)
        currentTimes += 1
    }

    currentTimes = 1
    
    while target * currentTimes <= n * m {
        if pivotTimes.contains(target * currentTimes) {
            return target * currentTimes
        }

        currentTimes += 1
    }

    
    return 0
}

print(lcs(n, m))