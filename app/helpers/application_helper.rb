module ApplicationHelper
  def current_class?(path)
    (request.path == path ? 'active' : '')
  end
end
