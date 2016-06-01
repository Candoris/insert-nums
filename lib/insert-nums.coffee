module.exports =
  activate: ->
    commandSubscription = atom.commands.add 'atom-text-editor',
      'insert-nums:insert': => @insert(false)
  dispose: ->
    commandSubscription.dispose()
  insert: () ->
    editor = atom.workspace.getActiveTextEditor()
    if editor
      sels = editor.getSelectionsOrderedByBufferPosition()
      for sel, index in sels
        sel.insertText((index + 1) + '')
