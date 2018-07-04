module ApplicationHelper
  def title(text)
    content_tag(:div, class: "page-header") do
      content_tag(:h1) do
        text
      end
    end
  end

  def nav_link(title, path)
    classValue = current_page?(path) ? 'active' : ''
    content_tag(:li, class: classValue) do
      link_to title, path
    end
  end
end
