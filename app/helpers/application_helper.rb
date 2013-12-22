module ApplicationHelper
  def div_to(text, link, options:{}, link_options:{})
    content_tag :div, options do
      link_to text, link, link_options
    end
  end
  
  def navbar_link(text, link, link_options: {})
    content_tag :li, :class => current_page?(link) ? "active" : "" do
      link_to text, link, link_options
    end
  end
  
  def bootstrap_form_for(name, *args, &block)
    options = args.extract_options!
    options.merge!(builder: BootstrapFormBuilder, html: {class: "form-horizontal", role: :form})
    form_for(name, *(args << options), &block)
  end
end
