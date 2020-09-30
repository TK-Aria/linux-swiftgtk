import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(linux_swiftgtkTests.allTests),
    ]
}
#endif
