import Foundation

// Complete the plusMinus function below.
func plusMinus(arr: [Int]) -> Void {
    
    var positiveAmount = 0.0
    var negativeAmount = 0.0
    var zeroAmount = 0.0
    let count = Double(arr.count)
    
    for number in arr {
        
        switch number {
        case let x where x > 0 :
            positiveAmount += 1
        case let x where x < 0 :
            negativeAmount += 1
        case let x where x == 0 :
            zeroAmount += 1
        default:
            break
        }
        
    }
    
    print(String(format: "%.6f", positiveAmount/count))
    print(String(format: "%.6f", negativeAmount/count))
    print(String(format: "%.6f", zeroAmount/count))
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine() else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
