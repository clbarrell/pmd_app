module ProjectsHelper

  def good_reference(project)
    if project.suitable_reference?
      "This project is a suitable reference."
    else
      "This project is not a suitable reference."
    end
  end


end
