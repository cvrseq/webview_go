# webview_go

[![GoDoc](https://godoc.org/github.com/webview/webview_go?status.svg)](https://godoc.org/github.com/webview/webview_go)
[![Go Report Card](https://goreportcard.com/badge/github.com/webview/webview_go)](https://goreportcard.com/report/github.com/webview/webview_go)

Go language binding for the [webview library][webview].

> [!NOTE]
> Versions <= 0.1.1 are available in the [old repository][webview].

### Getting Started

See [Go package documentation][go-docs] for the Go API documentation, or simply read the source code.

Start with creating a new directory structure for your project.

```sh
mkdir my-project && cd my-project
```

Create a new Go module.

```sh
go mod init example.com/app
```

Save one of the example programs into your project directory.

```sh
curl -sSLo main.go "https://raw.githubusercontent.com/webview/webview_go/master/examples/basic/main.go"
```

Install dependencies.

```sh
go get github.com/webview/webview_go
```

Build the example. On Windows, add `-ldflags="-H windowsgui"` to the command line.

```sh
go build
```

### Notes

Calling `Eval()` or `Dispatch()` before `Run()` does not work because the webview instance has only been configured and not yet started.

[go-docs]: https://pkg.go.dev/github.com/webview/webview_go
[webview]: https://github.com/webview/webview


# webview_go

GoDoc · Go Report Card

Go language binding for the webview library.

---

## 🚀 Added Feature — Custom User-Agent Support (macOS)

This fork adds **custom User-Agent support** for the macOS (Cocoa WebKit) backend.  
You can now set your own user agent string via the Go API.

### Example

```go
package main

import webview "github.com/webview/webview_go"

func main() {
	w := webview.New(false)
	defer w.Destroy()
	w.SetTitle("Custom User-Agent Example")
	w.SetSize(480, 320, webview.HintNone)
	w.SetUserAgent("Mozilla/5.0 (Macintosh; ARM64 Mac OS X 14_0_0) Custom/1.0")
	w.Navigate("https://www.whatismybrowser.com/detect/what-is-my-user-agent/")
	w.Run()
}




How to Build
```bash
# Build the native C++ library
./build.sh
```
```bash
# Run the example
go run ./examples/basic/main.go
```
