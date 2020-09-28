class Export < BasePage
  def visit_export_page
    visit(Links::EXPORT)
    on_page!
  end
end
