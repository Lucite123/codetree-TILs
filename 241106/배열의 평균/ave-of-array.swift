import Foundation

let n = 2

var numbers = [[Int]]()

for _ in 0 ..< n {
    let input = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
    numbers.append(input)
}

// 가로평균
for number in numbers {
    let sum = number.reduce(0, +)
    let average: Double = Double(sum / number.count)
    print(average, terminator: " ")
}

print()
/// 세로 평균

for index in 0 ..< 4 {
    let up = numbers[0][index]
    let down = numbers[1][index]

    let average = Double((up + down) / 2)
    print(average, terminator: " ")
}

/// 전체 평균
print()

var total = 0

for number in numbers {
    total += number.reduce(0, + )
}

print(Double(total / 8))