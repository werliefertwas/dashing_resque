class Dashing.ResqueList extends Dashing.Widget
  @accessor 'total', ->
    total = 0
    if @get('items')
      for item in @get('items')
        total += item.value
    total
