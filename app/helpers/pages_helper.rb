module PagesHelper
  def link_to_report_image(report)
    unless report.assets.empty?
      link_to image_tag(report.image.url(:small), :class => "woo-image alignleft thumbnail"), report, :title => report.subject
    end
  end
end
