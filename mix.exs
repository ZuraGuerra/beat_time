defmodule BeatTime.MixProject do
  use Mix.Project

  def project do
    [
      app: :beat_time,
      name: ".beat Time",
      version: "1.0.0",
      source_url: "https://github.com/ZuraGuerra/beat_time",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Utilities to work with Swatch Internet Time (.beat time)."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dumballah, "~> 2.3"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Zura Guerra"],
      links: %{
        "Github" => "https://github.com/ZuraGuerra/beat_time"
      }
    ]
  end
end
