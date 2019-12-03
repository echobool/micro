package main

import (
	"github.com/micro/micro/cmd"
	"github.com/micro/micro/plugin"
	"github.com/micro/go-plugins/micro/index"
)

func init() {
	plugin.Register(index.NewPlugin())
}

func main() {
	cmd.Init()
}
