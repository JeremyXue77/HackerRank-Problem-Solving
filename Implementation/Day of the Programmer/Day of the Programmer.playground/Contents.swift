import Foundation

// Complete the dayOfProgrammer function below.
func dayOfProgrammer(year: Int) -> String {
    
    switch year {
    case 1700...1917:
        if year % 4 == 0 {
            return "12.09.\(year)"
        } else {
            return "13.09.\(year)"
        }
    case 1918:
        return "26.09.\(year)"
    default:
        if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0 ) {
            return "12.09.\(year)"
        } else {
            return "13.09.\(year)"
        }
    }
    
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let year = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

let result = dayOfProgrammer(year: year)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
