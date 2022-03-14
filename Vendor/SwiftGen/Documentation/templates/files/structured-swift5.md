## Template Information

| Name      | Description       |
| --------- | ----------------- |
| File name | files/structured-swift5.stencil |
| Configuration example | <pre>files:<br />  inputs: dir/to/search/with/filter<br />  filter: .+\.*$<br />  outputs:<br />    templateName: structured-swift5<br />    output:Files.swift</pre> |
| Language | Swift 5 |
| Author | Mike Gray |

## When to use it

- When you need to generate *Swift 5* code.

## Customization

| Parameter Name | Default Value | Description |
| -------------- | ------------- | ----------- |
| `bundle` | `BundleToken.bundle` | Allows you to set from which bundle files are loaded from. By default, it'll point to the same bundle as where the generated code is. |
| `enumName` | `Files` | Allows you to change the name of the generated `enum` containing the file tree. |
| `preservePath` | N/A | Setting this parameter will disable the basename filter applied to all font paths. Use this if you added your font folder as a "folder reference" in your Xcode project, making that folder hierarchy preserved once copied in the build app bundle. The path will be relative to the folder you provided to SwiftGen. |
| `publicAccess` | N/A | If set, the generated constants will be marked as `public`. Otherwise, they'll be declared `internal`. |
| `resourceTypeName` | `File` | Allows you to change the name of the struct type representing a file. |
| `useExtension` | `true` | Whether or not to use the extension in the name of the constant. i.e. `let testTxt` vs `let test`. Behavior is undefined with file name conflicts. |

## Generated Code

**Extract:**

```swift
internal enum Files {
  /// test.txt
  internal static let testTxt = File(name: "test", ext: "txt", path: "", mimeType: "text/plain")
  /// subdir/
  internal enum Subdir {
    /// subdir/A Video With Spaces.mp4
    internal static let aVideoWithSpacesMp4 = File(name: "A Video With Spaces", ext: "mp4", path: "subdir", mimeType: "video/mp4")
  }
}
```

[Full generated code](../../../Sources/TestUtils/Fixtures/Generated/Files/swift5/defaults.swift)

## Usage example

```swift
// Access files using the `url` or `path` fields
let txt = Files.testTxt.url
let video = Files.Subdir.aVideoWithSpacesMp4.path

// In addition, there are `url(locale:)` and `path(locale:)` to specify a locale
let txt = Files.testTxt.url(locale: Locale.current)
let video = Files.Subdir.aVideoWithSpacesMp4.path(locale: Locale.current)
```
