#! /usr/bin/env ruby

# コマンドラインから受け取ったファイルを読み込み、単語数を出力する。
# 単語とは、正規表現 \p{Word} の文字列とする。
puts ARGF.read.scan(/\p{Word}+/).size
