#= require jquery
#= require jquery_ujs
#= require bootstrap


#= require admin/app
#= require_tree ./admin
#= require_self

$ ->
  new App.GalleryForm($el: $form) if ($form = $('#gallery-form')).length
