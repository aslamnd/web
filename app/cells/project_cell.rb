class ProjectCell < Cell::Rails

  helper ProjectsHelper

  def latest
    @project = Project.promoted.last
    render
  end

end
