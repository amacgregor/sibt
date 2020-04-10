defmodule SibtWeb.ProjectView do
  use SibtWeb, :view

  def title("show.html", assigns) do
    "Project: " <> assigns.project.title
  end

  def title(_, _assigns) do
    "Build your ideas without coding"
  end

end
