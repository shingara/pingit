module DecoratorHelper
  def setup_decorator
    c = ApplicationController.new
    c.request = ActionDispatch::TestRequest.new
    c.set_current_view_context
  end
end
