defmodule ExGuard.Mixfile do
  use Mix.Project

  @version "1.1.1"

  def project do
    [app: :ex_guard,
     version: @version,
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     description: description,

     name: "ExGuard",
     docs: [source_ref: "#{@version}", main: "Mix.Tasks.Guard", logo: "logo-white.png"],
     source_url: "https://github.com/slashmili/ex_guard",]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:fs, "~> 0.9"},
     {:ex_doc, "~> 0.11.4", only: :dev},
     {:earmark, "~> 0.2.1", only: :dev},
     {:credo, "~> 0.3", only: [:dev, :test]}]
  end

  defp package do
    [maintainers: ["Milad Rastian"],
     licenses: ["MIT"],
     links: %{github: "https://github.com/slashmili/ex_guard"},
     files: ~w(lib priv LICENSE mix.exs logo-white.png) ++
            ~w(brunch-config.js CHANGELOG.md LICENSE.md mix.exs package.json README.md)]
  end

  defp description do
     """
     ExGuard automates various tasks by running custom rules whenever file or directories are modified.
     """
  end
end
