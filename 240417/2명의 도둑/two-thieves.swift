import Foundation

let nmc = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nmc[0]
let m = nmc[1]
let c = nmc[2]

var map = [[Int]]()

for _ in 0..<n {
    let row = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    map.append(row)
}

// func calculateValue(_ weights: [Int]) -> Int {
//     print(weights)
//     var value = 0 
    
//     var sortedWeights = weights.sorted(by: >)
//     print(sortedWeights)

//     while sortedWeights.reduce(0, +) >= c {
//         sortedWeights.removeLast()
//     }


//     for weight in sortedWeights {
//         value += weight * weight
//     }

//     return value
// }

func isValidRange(_ x: Int, _ y: Int) -> Bool {
    return (x >= 0 && x <= n - 1) && (y >= 0 && y <= n - 1)
}

// var weights = [Int]()

// var visited = Array(repeating: Array(repeating: false, count: n), count: n)

// var maxValue = 0
// var firstValue = 0

// func findCombination(_ count: Int, _ row: Int) {
//     if count == m {
//         let value = calculateValue(weights) + firstValue
//         maxValue = max(maxValue, value)
//         return
//     }

//     if isValidRange(row, count) && visited[row][count] == false {

//         for i in count ..< count + m {
//             if isValidRange(row, i) {
//                 weights.append(map[row][count])
//                 findCombination(count + 1, row)
//                 weights.removeLast()
//             }
//         }
        
//     }

//     findCombination(count + 1, row)
// }

func isPossible(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
    if y1 + m - 1 > n - 1 || y2 + m - 1 > n - 1{
        return false
    }

    if x1 != x2 {
        return true
    }

    // intersect에 대해서 조금 더 생각해보기

    if y1 + m - 1 >= x2 || x1 <= y2 + m - 1  {
        return false
    }



    return true
}

var weights = [Int]()
var selectedWeights = [Int]()

var max_val = 0


func findCombination(_ count: Int)  {
    if count == m {
        if selectedWeights.reduce(0, + ) <= c {
            var result = 0
            // print(selectedWeights)
            for weight in selectedWeights {
                result += weight * weight
            }

            max_val = max(max_val, result)
        }

        return
    }

    selectedWeights.append(weights[count])
    findCombination(count + 1)
    selectedWeights.removeLast()

    findCombination(count + 1)
}

func findMax(_ x: Int, _ y: Int) -> Int {
    weights = [Int]()
    for i in y..<y + m {
        weights.append(map[x][i])
    }
    max_val = 0
    findCombination(0)
    return max_val
}


var maxValue = 0

for x1 in 0 ..< n {
    for y1 in  0 ..< n {
        for x2 in 0 ..< n {
            for y2 in 0 ..< n {
                if isPossible(x1, y1, x2, y2) {
                    let x1Value = findMax(x1, y1)
                    let y2Value = findMax(x2, y2)
                    maxValue = max(maxValue, x1Value + y2Value)
                    // print(x1, y1)
                    // print(x1Value)

                    // print(x2, y2)
                    // print(y2Value)
                }
            }
        }
    }
}

print(maxValue)