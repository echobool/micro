package main

import (
	"github.com/micro/go-plugins/micro/index"
	"github.com/micro/micro/cmd"
	"github.com/micro/micro/plugin"
)

func init() {
	plugin.Register(index.NewPlugin())
}

func main() {
	cmd.Init()
}
