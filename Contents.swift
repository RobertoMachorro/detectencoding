import Cocoa

if let fileURL = Bundle.main.url(forResource: "test", withExtension: "txt"),
	let data = try? NSData(contentsOf: fileURL) as Data {

	// Using NSString.stringEncoding

	var convertedString: NSString?
	let encoding = NSString.stringEncoding(for: data, encodingOptions: nil, convertedString: &convertedString, usedLossyConversion: nil)
	if let text = convertedString as String? {
		let encodingName = String.Encoding.init(rawValue: encoding)
		print("[\(text)] \(encodingName)")
	}

	// By trial and error

	if let text = String(data: data, encoding: .utf8) {
		print("[\(text)] UTF8")
	} else if let text = String(data: data, encoding: .macOSRoman) {
		print("[\(text)] macOSRoman")
	} else if let text = String(data: data, encoding: .ascii) {
		print("[\(text)] ASCII")
	}
}
