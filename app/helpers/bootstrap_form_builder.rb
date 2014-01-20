class BootstrapFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(label, args={})
    #puts args
    #puts @template.label(label, args[:label] ? args[:label] : label, class: "col-xs-1 control-label")
    @template.content_tag(:div,
      (!args[:no_label] ? @template.label(@object_name,(args[:label] ? args[:label] : label), class: "sr-only control-label") : "").html_safe +
        super(label, args.merge(class: "form-control", placeholder: args[:label] ? args[:label] : label.to_s.humanize)),
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
  
  def submit(args={})
    if args[:class]
      args[:class]+=" btn"
    else
      args[:class] = "btn"
    end
    super(args)
  end
end