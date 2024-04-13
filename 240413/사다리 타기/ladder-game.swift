import Foundation


let nm = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

struct Line: Hashable, Comparable {
	let a: Int
	let b: Int

    // TODO: 정렬순서 확인
    static func < (lhs: Line, rhs: Line) -> Bool {
        if lhs.b > rhs.b {
            return true
        }

        return false
    }
}

var lines = [Line]()

for _ in 0 ..< m {
    let line = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    lines.append(Line(a: line[0] - 1, b: line[1] - 1))
}

func initialResult(_ lines: [Line]) -> [Int] {
    let sortedLines = lines.sorted()
    var persons = [Int]()

    for person in 0 ..< n {
        persons.append(person)
    }

    for line in sortedLines {
        var temp = persons[line.a]
        persons[line.a] = persons[line.a + 1]
        persons[line.a + 1] = temp
    }

    return persons
}

let pivot = initialResult(lines)

var selectedLines = [Line]()

func isPossible() -> Bool {

    let sortedSelectedLines = selectedLines.sorted()
    var persons = [Int]()

    for person in 0..<n {
        persons.append(person)
    }

    for line in sortedSelectedLines {
        var temp = persons[line.a]
        persons[line.a] = persons[line.a + 1]
        persons[line.a + 1] = temp
    }

    // print(persons)
    // print(sortedSelectedLines)
    if pivot == persons {
        return true
    }

    return false
}

var minCount = lines.count

func findCombination(_ cnt: Int) {
    if cnt == m {
        return 
    }

    selectedLines.append(lines[cnt])
    findCombination(cnt + 1)
    if isPossible() {
        minCount = min(minCount, selectedLines.count)
    }
    selectedLines.removeLast()

    
    findCombination(cnt + 1)
    if isPossible() {
        minCount = min(minCount, selectedLines.count)
    }
}



findCombination(0)

print(minCount)