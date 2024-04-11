import Foundation

let digit = Int(readLine()!)!

// 동일한 숫자에 대해 연달아 같은 숫자의 묶음이 나오는 것

var numbers = [Int]()
var count = 0

func check() -> Bool {
    var index = 0

    while index < digit {
        if index + numbers[index] - 1 >= digit {
            return false
        }

        for innerIndex in index ..< index + numbers[index] {
            if numbers[index] != numbers[innerIndex] {
                return false
            }
        }
        index += numbers[index]
    }

    return true
}

func findPermutation(_ n: Int) {
    if n == digit {
        if check() {
            count += 1
        }
        return
    }

    for number in 1 ... 4 {
        numbers.append(number)
        findPermutation(n + 1)
        numbers.removeLast()
    }
}

findPermutation(0)
print(count)