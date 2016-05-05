# Ruby初級者向けレッスン 58回
## 文字列

### 演習問題1
1. 文字列の「行数」を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex11.rb)
1. 文字列の「単語数」を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex12.rb)
1. 文字列の「文字数」を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex13.rb)
1. 文字列の「バイト数」を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex14.rb)

### 演習問題2
1. 文字列の「単語」の出現回数を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex21.rb)
1. 文字列の「文字」の出現回数を数えてみよう。[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex22.rb)

### 演習問題3

ケブンリッジ問題

```ruby
#! /usr/bin/env ruby
 
cambridge = <<EOF.chomp
こんにちは みなさん おげんき ですか ? わたしは げんき です 。 この ぶんしょう は イギリス の ケンブリッジ だいがく の けんきゅう の けっか にんげん は もじ を にんしき する とき その さいしょ と さいご の もじさえ あっていれば じゅんばん は めちゃくちゃ でも ちゃんと よめる と いう けんきゅう に もとづいて わざと もじの じゅんばん を いれかえて あります 。 どうです ? ちゃんと よめちゃう でしょ ? ちゃんと よめたら はんのう よろしく
EOF
 
if $0 == __FILE__
   puts cambridge
end 
```

* 最初と最後以外を滅茶苦茶に

```ruby
def cambridge(s)
  s[0] + 
    s[1...-1].chars.shuffle.join +
    s[-1]
end

s = "cambridge"                 # => "cambridge"
cambridge(s)                    # => "cidmbagre"
```

しかし "cidmbagre" を "cambridge" とは読めない。

* 最初と最後以外を 2文字ずつ入れ換える

```ruby
def cambridge(s)
  s[0] +
    s[1...-1].chars.each_slice(2).map(&:reverse).join +
    s[-1]
end

s                               # => "cambridge"
cambridge(s)                    # => "cmarbdige"
```

どでうす ? ちんゃと よちめゃう でしょ ?

[解答例](https://github.com/higaki/learn_ruby_kansai_72/blob/master/ex3.rb)

* オープンクラスを利用して、`String` クラスに `cambridge!` と `cambridge` メソッドと追加する。
  * refinements を利用して、影響範囲を限定する。
* まず、破壊的メソッドを作成し、非破壊メソッドから破壊的メソッドを呼び出す。
  * 破壊的メソッドは、値が変化しない場合は `nil` を返す。
* 元の文字列はヒアドキュメントで作成。
* 空白 (タブ, 改行) で分割して、その全てに cambridge を呼び出す。
