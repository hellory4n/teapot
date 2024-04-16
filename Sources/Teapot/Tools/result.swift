import Foundation

enum TeaResult<T> {
    case out(o: T)
    case errors(e: [TeaError])
}

struct TeaError {
    let error: String
    let severity: Severity
    let line: UInt
}

enum Severity {
    case critical, warning, suggestion
}