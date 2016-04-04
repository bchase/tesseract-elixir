defmodule Tesseract do
  def scan!(img_path, [lang: lang] = _options) when not is_list(lang) do
    exec img_path, [lang]
  end

  def scan!(img_path, [lang: langs] = _options \\ [lang: [:eng]]) do
    exec img_path, langs
  end


  defp exec(img_path, langs) do
    {input, output} = {img_path, "stdout"}
    args = [input, output, "-l", langs_str(langs)]
    {txt, 0} = System.cmd "tesseract", args, stderr_to_stdout: true
    txt
  end

  defp langs_str(langs) do
    Enum.join langs, "+"
  end
end
