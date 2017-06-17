FileEditor = require './file-editor'

module.exports =
class ARTEditor extends FileEditor
  atom.deserializers.add(this)

  getViewClass: -> require './art-editor-view'
  isEqual: (other) -> other instanceof ARTEditor and @getURI() is other.getURI()