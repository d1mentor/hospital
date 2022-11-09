module ApplicationHelper
  def current_path
    request.env['PATH_INFO']
  end

  def doctor_path?
    current_path.include?('doctor')
  end
end
