# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require holder
#= require_tree .

$ ->
  for collapse_toggler in $(".collapse-toggler")
    $(collapse_toggler).click (e) ->
      $($(e.target).parent().data('target')).collapse('toggle')
  for collapsable in $(".collapsable")
    $(collapsable).on 'hide.bs.collapse', (e) ->
      i=e.target.id.substring("collapse".length)
      $("#chevron"+i).removeClass("rotate90")
      $(e.target).parent().parent().children().toggleClass("show-cell hide-cell")
      $("#chevron"+i).addClass("rotate0")
    $(collapsable).on 'show.bs.collapse', (e) ->
      i=e.target.id.substring("collapse".length)
      $("#chevron"+i).removeClass("rotate0")
      $(e.target).parent().parent().children().toggleClass("show-cell hide-cell")
      $("#chevron"+i).addClass("rotate90")
    #$(collapsable).on 'hidden.bs.collapse', (e) ->
    #  $(e.target).parent().addClass("hidden")
    #$(collapsable).on 'show.bs.collapse', (e) ->
    #  $(e.target).parent().removeClass("hidden")
  
  for row in $("tr[data-href]")
    $(row).click (e) ->
      return if $(e.target).parent().hasClass("btn-group")
      window.location = $(e.target).closest("tr").data("href")

  window.setTimeout (->
    ele = $(".alert-success")
    ele.fadeOut callback = ->
      ele[0].parentNode.removeChild ele[0]
  
  ), 7000
  
  $(document).bind 'page:change', ->
    Holder.run()