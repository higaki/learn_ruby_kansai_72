#! /usr/bin/env ruby

# コマンドラインから受け取ったファイルを読み込み、単語の出現回数を出力する。
# 単語とは、正規表現 \p{Word} の文字列とする。
# 出現回数の多い順に回数と単語を出力する。
# 出現回数が同じなら、単語のコード順に出力する。
puts ARGF.read.scan(/\p{Word}+/)
  .inject(Hash.new{|h, k| h[k] = 0}){|h, w| h[w] += 1; h}
  .sort_by{|w, n| [-n, w]}
  .map{|w, n| "%8d: %s" % [n, w]}
