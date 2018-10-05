import Foundation

// Complete the migratoryBirds function below.
func migratoryBirds(arr: [Int]) -> Int {
    
    let set = Array(Set(arr)).sorted()
    
    var currentType = 0
    var maxCount = 0
    
    for birdType in set {

        var count = 0
        
        for type in arr {
            if birdType == type {
                count += 1
            }
        }
        
        if count > maxCount {
            currentType = birdType
            maxCount = count
        }
    }
    
    return currentType
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == arrCount else { fatalError("Bad input") }

let result = migratoryBirds(arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
