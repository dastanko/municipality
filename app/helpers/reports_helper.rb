module ReportsHelper
  def link_to_image(report)
    if report.assets.empty?
      link_to image_tag("no_photo.png", :class => "woo-image alignleft thumbnail"), report, :title => report.subject
    else
      link_to image_tag(report.image.url(:thumb), :class => "woo-image alignleft thumbnail"), report, :title => report.subject
    end
  end

  def image(report)
    if report.assets.empty?
      image_tag "no_photo.png"
    else
      image_tag report.image.url(:medium)
    end
  end
end