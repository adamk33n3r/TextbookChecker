class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(label, args={})
    @template.content_tag(:div,
      @template.label(@object_name, object, args[:label] ? args[:label] : label, class: "#{args[:no_label] ? "sr-only" : "control-label"}") +
      super(label, args.merge(class: "form-control", placeholder: args[:label] ? args[:label] : label.to_s.humanize)),
    class: "form-group")
  end
  
  def text_area(object, args={})
    @template.content_tag(:div,
      @template.label(@object_name, object, args[:label] ? args[:label] : object, class: "#{args[:no_label] ? "sr-only" : "control-label"}") +
      super(object, args.merge(class: "form-control")),
    class: "form-group")
  end
  
  def number_field(label, args={})
    @template.content_tag(:div,
      @template.label(@object_name, label, class: "sr-only control-label") +
      super(label, args.merge(class: "form-control", placeholder: label.to_s.humanize)),
    class: "form-group")
  end
  
  def date_field(label, args={})
    puts args
    args["value"] = Date.today if @object.new_record?
    @template.content_tag(:div,
      @template.label(@object_name, label, class: "sr-only control-label") +
      super(label, args.merge(class: "form-control")),
    class: "form-group")
  end
  
  def radio_button_group(attrib, object, args={})
    group="<div class=\"form-group\">"
    if args[:label]
      group+=@template.content_tag :div, @template.content_tag(:strong, args[:label])
    end
    object.all.each do |entry|
      group+=self.radio_button(attrib, entry.id, entry)
    end
    (group+"</div>").html_safe
  end
  
  def radio_button(attrib, value, label, args={})
    @template.label(@object_name, attrib, super(attrib, value, args)+label, value: value, class: "radio-inline")
  end
  
  def submit(args={})
    if args[:class]
      args[:class]+=" btn"
    else
      args[:class] = "btn"
    end
    super(args)
  end
end