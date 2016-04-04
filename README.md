# Tesseract

A simple Elixir wrapper for the [Tesseract OCR](https://github.com/tesseract-ocr/tesseract).

# Requirements

It's assumed that you have `tesseract` and all desired languages installed. For example, if you wanted to scan English (Tesseract's default language) and Japanese, you could get set up in a Debian-based system with:

```
$ sudo apt-get install tesseract-ocr tesseract-ocr-jpn
```

# Installation

I didn't bother to put this in Hex since it's so simple. `lib/tesseract.ex` is really all there is.

```
$ curl https://raw.githubusercontent.com/bchase/tesseract-elixir/master/lib/tesseract.ex >> lib/tesseract.ex
```

# Usage

We can scan the image text of `test/support/reibun.png` like so:

![Image to be scanned: "例文　れいぶん　model sentence"](https://raw.githubusercontent.com/bchase/tesseract-elixir/master/test/support/reibun.png)

```
Tesseract.scan! "test/support/reibun.png" # defaults to English
# => "my: (ﬂLMSi/v) (n) model sentence: (P):\n\n"

Tesseract.scan! "test/support/reibun.png", lang: :jpn
# => "例文 (れいぶん) (n) m0deー SentenCe; (P);\n\n"

Tesseract.scan! "test/support/reibun.png", lang: [:jpn, :eng]
# => "例文 (れいぶん) (n) model sentence: (P):\n\n"
```
