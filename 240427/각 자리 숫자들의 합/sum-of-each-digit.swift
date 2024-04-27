import Foundation

var n = Int(readLine()!)!

var result = 0

while n >= 10 {
    result += n % 10
    n /= 10
}

result += n

print(result)