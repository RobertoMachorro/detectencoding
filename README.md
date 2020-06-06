# detectencoding

Xcode Swift Playground showing an issue with NSString.stringEncoding

## The Problem

The sample file ([test.txt in Resource Bundle](https://raw.githubusercontent.com/RobertoMachorro/detectencoding/master/Resources/test.txt)) contains umlauts and other special characters.
It does not contain a BOM. When trying to read the file via NSData (as passed by NSDocument) and converting to a String for usage, an Encoding must be passed.

*What is the Encoding?* We don't know, so we use the _NSString.stringEncoding_ method to detect it. It also converts it automatically to a String. Nifty! Until it doesn't work.

When the sample code is run, we can see the umlauts and accented characters being displayed incorrectly. In the second block, by converting the text using trial and error, we see that the file is in _macOSRoman_ and displays the characters correctly.

```
[Gџltig bis:	
Fџr Benutzung  
Gџltig bis:
RenЋ 
] Cyrillic (Windows)
[Gültig bis:	
Für Benutzung  
Gültig bis:
René 
] macOSRoman
```

## References

* [NSString.stringEncoding](https://developer.apple.com/documentation/foundation/nsstring/1413576-stringencoding)
* [NSStringEncoding](https://developer.apple.com/documentation/foundation/nsstringencoding)
* [Guess encoding when creating an NSString from NSData](https://stackoverflow.com/questions/1351151/guess-encoding-when-creating-an-nsstring-from-nsdata)
