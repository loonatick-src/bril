public indirect enum Type: Equatable {
    case primitive(String)
    case parameterized(String, Type)
}

extension Type: Decodable {
    public init(from decoder: Decoder) throws {
        if let str = try? decoder.singleValueContainer().decode(String.self) {
            self = .primitive(str)
        } else {
            let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
            let keys = container.allKeys
            guard !keys.isEmpty else {
                throw TypeDecodeError.missingType
            }
            guard keys.count == 1 else {
                throw TypeDecodeError.tooManyKeys(container.allKeys)
            }
            let key = keys.first!
            let value = try container.decode(Type.self, forKey: key)
            self = .parameterized(key.stringValue, value)
        }
    }
}

extension Type: CustomStringConvertible {
    public var description: String {
        switch self {
            case .primitive(let type):
                return type
            case .parameterized(let wrapper, let type):
                return "\(wrapper)<\(type)>"
        }
    }
}

private struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue str: String) { self.stringValue = str }
    var intValue: Int? { nil }
    init?(intValue: Int) { nil }
}

public enum TypeDecodeError: Error { 
    case missingType
    case tooManyKeys([CodingKey])
}

extension TypeDecodeError: CustomStringConvertible {
    public var description: String {
        switch(self) {
            case .missingType:
            "Empty type field, no primivitive or parametirized types found."
            case .tooManyKeys(let keys):
            "Expected one key in parameterized type, found \(keys.count): \(keys)."
        }
    }
}
