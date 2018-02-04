$(document).on 'turbolinks:load', ->
  return unless $('body[data-controller-name="hello"]').length > 0

  $('#table-filter').on 'keyup', (event) ->
    if (event.keyCode == 13)
      $('tr.filterable-row').show()
      applyFilter($(this))

applyFilter = (filter) ->
  filterValue = filter.val()
  if (filterValue.trim().length)
    filterRows(filterValue)

filterRows = (filterValue) ->
  valueWithSpace = filterValue.replace /\s/g, '\xa0'
  $.expr[':'].contains = $.expr.createPseudo (arg) ->
    return (elem) ->
      return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
  $('tr.filterable-row').hide()
  $("tr.filterable-row td:contains('" + valueWithSpace + "')").parent().show()