import Foundation

/*
 * Complete the timeConversion function below.
 */
func timeConversion(s: String) -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    dateFormatter.dateFormat = "hh:mm:ssa"
    
    let date = dateFormatter.date(from: s)
    dateFormatter.dateFormat = "HH:mm:ss"
    let dateString = dateFormatter.string(from: date!)
    
    return dateString
}

let fileName = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: fileName, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: fileName)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
