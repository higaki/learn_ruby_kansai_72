#! /usr/bin/env ruby

# コマンドラインから受け取ったファイルを読み込み、バイト数を出力する。
puts ARGF.read.bytes.size
