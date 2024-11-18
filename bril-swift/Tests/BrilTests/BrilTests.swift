    import XCTest
    @testable import Bril

    final class BrilTests: XCTestCase {
        func testDecode() throws {
            for testCase in TestCases.allCases {
                guard let program = CheckNoThrow(
                    try JSONDecoder().decode(Program.self, from: testCase.source),
                    "Unable to decode program JSON"
                ) else {
                    continue
                }
                let groundTruth = testCase.groundTruth
                XCTAssertEqual(program.functions.count, groundTruth.keys.count)
                for fn in program.functions {
                    XCTAssertEqual(fn.code.count, groundTruth[fn.name]!)
                }
            }
        }

        /// The original test
        func testBasic() throws {
            let source = TestCases.theOriginal.source
            let program = try JSONDecoder().decode(Program.self, from: source)
            XCTAssertEqual(program.functions.count, 1)
            XCTAssertEqual(program.functions[0].code.count, 15)
        }

        /// Get the return value from the expression in `XCTAssertNoThrow`
        /// https://stackoverflow.com/a/67050989
        func CheckNoThrow<T>(
            _ expression: @autoclosure () throws -> T,
            _ message: @autoclosure () -> String = "",
            file: StaticString = (#filePath),
            line: UInt = #line
        ) -> T? {
            var r: T?
            XCTAssertNoThrow(
                try { r = try expression() }(), message(), file: file, line: line)
            return r
        }
    }
        
