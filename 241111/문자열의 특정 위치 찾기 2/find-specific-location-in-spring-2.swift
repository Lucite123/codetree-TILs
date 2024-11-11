import Foundation

let fivot = ["apple", "banana", "grape", "blueberry", "orange"]
let target = readLine()!

var result = [String]()

for partialFivot in fivot {
    let partialFivotArray = partialFivot.map { String($0) }
    if partialFivotArray[2] == target || partialFivotArray[3] == target {
        result.append(partialFivot)
    }
}

for partialResult in result {
    print(partialResult)
}
print(result.count)