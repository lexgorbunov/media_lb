class App.GalleryForm
  constructor: (@options = {}) ->
    throw new Error("Required argument $el was not passed") unless @options.$el?.length
    @$el = @options.$el
    @imagesIndex = -1

    @setHandlers()

  setHandlers: ->
    @$el.on 'click', '.js-btn-add-image', @onAddImageClick
    @$el.on 'click', '.js-btn-remove-image', @onRemoveImageClick

  onAddImageClick: (e) =>
    @$el.find('.js-gallery-images-list').append(@makeFileInputNode())

  onRemoveImageClick: (e) =>
    $item = $(e.currentTarget).closest('.is-photo-item')
    if ($destroyInput = $item.find('input:hidden[name$="[_destroy]"]')).length
      $destroyInput.val(1)
      $item.hide()
    else
      $item.remove()

  makeFileInputNode: ->
    index = @getItemIndex()
    $('<div class="is-photo-item form-group">' +
          '<div class="form-group file-input-placeholder">' +
            '<span class="item-title">Загрузить:</span>' +
            "<input type='file' name='gallery[photos_attributes][#{index}][image_attributes][file]'>" +
            '<div class="btn btn-danger js-btn-remove-image"><i class="glyphicon glyphicon-trash"></i></div>' +
          '</div>' +
          '<div class="form-group">' +
            "<input class='form-control' placeholder='Ссылка' type='url' name='gallery[photos_attributes][#{index}][link]'>" +
          '</div>' +
        '</div>')

  getItemIndex: ->
    @$el.find('.is-photo-item').length
