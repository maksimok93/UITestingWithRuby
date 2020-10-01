# frozen_string_literal: true

# Methods which can be used on Export Page
class Export < BasePage
  def visit_export_page
    visit(Links::EXPORT)
    on_page!
  end
end
