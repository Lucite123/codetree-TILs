import Foundation

let count = Int(readLine()!)!

var lines = [Line]()

for _ in 0 ..< count {
    let line = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    lines.append(Line(x1: line[0], x2: line[1]))
}

struct Line: Comparable {
    let x1: Int
    let x2: Int

    public static func < (lhs: Self, rhs: Self) -> Bool {
        if lhs.x1 < rhs.x1 {
            return true
        } else if lhs.x1 == rhs.x1 {
            if lhs.x2 < rhs.x2 {
                return true
            }
        }

        return false
    }
}





var maxCount = 0

func updateMaxCount(_ choiceLines: [Line]) {
    var count = 1
    var currentIndex = 0
    var nextIndex = 1
    let sortedChoiceLines = choiceLines.sorted()
    // print(choiceLines)

    while nextIndex <= choiceLines.count - 1 {
        let currentLine = sortedChoiceLines[currentIndex]
        let nextLine = sortedChoiceLines[nextIndex]

        if currentLine.x2 < nextLine.x1 {
            currentIndex += 1
            count += 1
        }

        nextIndex += 1
    }

    maxCount = max(maxCount, count)
}

var choiceLines = [Line]()

func findPermutation(_ n: Int) {
    if n == count {
        return
    }

    choiceLines.append(lines[n])
    updateMaxCount(choiceLines)
    findPermutation(n + 1)
    choiceLines.removeLast()

    findPermutation(n + 1)
    updateMaxCount(choiceLines)
}


findPermutation(0)
print(maxCount)