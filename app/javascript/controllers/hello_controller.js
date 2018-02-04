import {Controller} from 'stimulus'

export default class extends Controller {
  static targets = ['filter']

  typeFilter(event) {
    if (this.enterPressed(event)) {
      $('tr.filterable-row').show()
      this.applyFilter()
    }
  }

  enterPressed(event) {
    return event.keyCode === 13
  }

  applyFilter() {
    var filterValue = $(this.filterTarget).val()
    if (filterValue.trim().length)
      this.filterRows(filterValue)
  }

  filterRows(filterValue) {
    var valueWithSpace = filterValue.replace(/\s/g, '\xa0')
    $.expr[':'].contains = $.expr.createPseudo((arg) => {
      return (elem) => {
        return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
      }
    })
    $('tr.filterable-row').hide()
    $("tr.filterable-row td:contains('" + valueWithSpace + "')").parent().show()
  }
}