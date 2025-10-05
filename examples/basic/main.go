package main

import webview "github.com/webview/webview_go"

func main() {
	w := webview.New(false)
	defer w.Destroy()
	w.SetTitle("Test UserAgent")
	w.SetSize(480, 320, webview.HintNone)
	w.SetUserAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 14_0_0) Custom/1.0")
	w.Navigate("https://www.whatismybrowser.com/detect/what-is-my-user-agent/")
	w.Run()
}
