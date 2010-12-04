module ApplicationHelper

  def move_link(direction)
    content_tag('div', class: "go-#{direction}") do
      link_to(image_tag("go-#{direction}.jpg", :alt => "Go #{direction.titlecase}", :title => "Go #{direction.titlecase}"), move_path(direction))
    end
  end

end
