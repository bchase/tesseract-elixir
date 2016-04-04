defmodule TesseractTest do
  use ExUnit.Case
  doctest Tesseract

  test "scan in English (default)" do
    text = Tesseract.scan!("test/support/reibun.png")
    assert String.match? text, ~r{model sentence}

    text = Tesseract.scan!("test/support/reibun.png", lang: :eng)
    assert String.match? text, ~r{model sentence}
  end

  test "scan in Japanese" do
    text = Tesseract.scan!("test/support/reibun.png", lang: :jpn)

    assert String.match? text, ~r{例文}
    assert String.match? text, ~r{れいぶん}
  end

  test "scan in Japanese and English" do
    text = Tesseract.scan!("test/support/reibun.png", lang: [:jpn, :eng])

    assert String.match? text, ~r{例文}
    assert String.match? text, ~r{れいぶん}
    assert String.match? text, ~r{model sentence}
  end
end
