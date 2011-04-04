class ProjectCell < Cell::Rails

  helper ProjectsHelper

  def latest
    @project = Project.promoted.first
    render
  end

end
