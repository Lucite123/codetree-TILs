import Foundation

func isYoon(_ year: Int) -> Bool {
    if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                return true
            }

            return false
        }
        return true
    }   

    return false   
}

func seasonMapper(_ month: Int) -> String {
    let seasons: [String] = [
    "Spring",
    "Summer",
    "Fall",
    "Winter"
    ]

    if month >= 3 && month <= 5 {
        return seasons[0]
    }

    if month >= 6 && month <= 8 {
        return seasons[1]
    }

    if month >= 9 && month <= 11 {
        return seasons[2]
    }
    
    return seasons[3]
}

func isExistDay(_ year: Int, _ month: Int, _ day: Int) -> Bool {
    let days: [Int] = [
        0,
        31,
        28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31
    ]

    if month == 2 {
        if day > 28 {
            if isYoon(year) {
                if day == 29 {
                    return true
                }
            }

            return false
        }
    }

    let daysOfMonth = days[month]

    if day > daysOfMonth {
        return false
    }

    return true
}

let ymd = readLine()!.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").map { Int(String($0))! }
let y = ymd[0]
let m = ymd[1]
let d = ymd[2]


if isExistDay(y, m, d) == false {
    print(-1)
    exit(0)
}

let season = seasonMapper(m)

print(season)