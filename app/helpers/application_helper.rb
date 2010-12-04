module ApplicationHelper

  def direction_arrow(direction, available_directions)
    content_tag('div', class: "go-#{direction}") do
      if available_directions.include? direction
        link_to(image_tag("go-#{direction}.jpg", :alt => "Go #{direction.titlecase}", :title => "Go #{direction.titlecase}"), move_path(direction)) 
      end
    end
  end

end
