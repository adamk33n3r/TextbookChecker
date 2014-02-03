module ApplicationHelper
  def link_to(name = nil, options = nil, html_options = nil, &block)
    super(name, options.nil? ? name : options, html_options, &block)
  end
  def blink_to(body, url, html_options = {})
    if html_options[:class]
      html_options[:class] = "btn " + html_options[:class]
    else
      html_options[:class] = "btn btn-default"
    end
    self.link_to body, url, html_options
  end
  
  def boolean(bool)
    icon = bool ? "check_small.png" : "cross_small.png"
    image_tag "icons/#{icon}", size: "12"
  end
  
  def gravatar_url(user, size=128)
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}?d=identicon&s=#{size}"
  end
  
  def div_to(text, link, options:{}, link_options:{})
    content_tag :div, options do
      link_to text, link, link_options
    end
  end
  
  def navbar_link(text, link, link_options: {})
    if link.is_a? String
      cont = URI.split(link)[5].split("/")
      if cont == []
        cont = "main"
      else
        cont = cont[1]
      end
      content_tag :li, :class => (params[:controller] == cont) ? "active" : "" do
        link_to text, link, link_options
      end
    else
      content_tag :li, :class => current_page?(link) ? "active" : "" do
        link_to text, link, link_options
      end
    end
  end
  
  def bootstrap_form_for(name, *args, &block)
    options = args.extract_options!
    options.merge!(builder: BootstrapFormBuilder, html: {role: :form})
    form_for(name, *(args << options), &block)
  end
  
  # Generates a table from the passed in list of objects. Assuming they are all of same type e.g. User.
  # 
  # Params:
  # +objects+:: the list of objects to be parsed
  # +exclusions+:: list of attributes to ignore. Default: []
  # +replacements+:: hash of attribute:name to change what is displayed e.g. {"is_ebook" => "eBook"}. Default: {}
  # +additions+:: hash of name:attribute to print out last
  # +first+:: hash of name:attribute to print out first
  def bootstrap_table_for(objects, exclusions:[], replacements:{}, additions:{}, first:{}, dropdown:[])
    return if objects.empty?
    exclusions += ["id", "created_at", "updated_at"]
    thead = content_tag :thead do
      content_tag :tr do
        concat_tag :th, ""
        first.each do |name, attr|
          concat(content_tag :th, name.titleize)
        end
        objects.first.attributes.except(*(exclusions+first.keys)).each do |attribute, value|
          concat(content_tag :th, replacements[attribute] ? replacements[attribute] : attribute.titleize)
        end
        additions.each do |item|
          concat(content_tag :th, item[0].titleize)
        end
        concat content_tag(:th)
      end
    end
    tbody = content_tag :tbody do
      objects.each do |obj|
        concat(content_tag(:tr, class: "pointer", data: {href: url_for(obj)}) do
          concat_tag :td, ""
          first.each do |name, attribute|
            begin
              concat_tag :td, obj.send(attribute)
            rescue NoMethodError
              concat(content_tag :td, "NoMethodFound: " + attribute)
            end
          end
          obj.attributes.except(*(exclusions+first.keys)).each do |attribute, value|
            if attribute[-3..-1] == "_id"
              val = obj.send(attribute[0..-4])
              concat_tag :td, link_to(val,val)
            else
              concat_tag :td, value
            end
          end
          additions.each do |item|
            begin
              #val.class.superclass == ActiveRecord::Base
              val = obj.send(item[1])
              concat_tag :td, val
            rescue NoMethodError
              concat(content_tag :td, "NoMethodFound: " + item[1])
            end
          end
          concat(content_tag(:td) do
            content_tag(:div, class: "btn-group") do
              link_to("Show", obj, class: "btn btn-xs btn-info") +
              link_to("Edit", url_for([:edit, obj]), class: "btn btn-xs btn-warning") +
                link_to("Delete", obj, class: "btn btn-xs btn-danger", method: :delete, data: { confirm: 'Are you sure?' })
            end
          end)
        end)
      end
    end
    content_tag :table, thead.concat(tbody), class: "table table-striped table-condensed table-hover"
  end
  
  def concat_tag(tag, content)
    if !!content == content
      concat(content_tag :td, boolean(content))
    else
      concat(content_tag(tag, content))
    end
  end
end