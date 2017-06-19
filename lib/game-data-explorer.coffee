path = require 'path'
fs = require 'fs-plus'

KEYEditor = require './key-editor'
TGAEditor = require './tga-editor'
WAVEditor = require './wav-editor'
MDLEditor = require './mdl-editor'
BFEditor = require './bf-editor'
DAT1Editor = require './dat1-editor'
DATEditor = require './dat-editor'
DIREditor = require './dir-editor'
PCKEditor = require './pck-editor'
ARTEditor = require './art-editor'
GLTFEditor = require './gltf-editor'

module.exports =
class GameDataExplorer
  @editors:
    '.key': (filePath) -> return new KEYEditor(path: filePath)
    '.mdl': (filePath) -> return new MDLEditor(path: filePath)
    '.tga': (filePath) -> return new TGAEditor(path: filePath)
    '.wav': (filePath) -> return new WAVEditor(path: filePath)
    '.wad': (filePath) -> return new WAVEditor(path: filePath)
    '.waa': (filePath) -> return new WAVEditor(path: filePath)
    '.wam': (filePath) -> return new WAVEditor(path: filePath)
    '.wac': (filePath) -> return new WAVEditor(path: filePath)
    '.dir': (filePath) -> return new DIREditor(path: filePath)
    '.dat': (filePath) ->
      try return new DAT1Editor(path: filePath) catch
      try return new DATEditor(path: filePath) catch
      return null
    '.pck': (filePath) -> return new PCKEditor(path: filePath)
    '.art': (filePath) -> return new ARTEditor(path: filePath)
    '.bf': (filePath) -> return new BFEditor(path: filePath)
    '.gltf': (filePath) -> return new GLTFEditor(path: filePath)

  @activate: ->
    @opener = atom.workspace.addOpener (filePath = '') =>
      if fs.isFileSync(filePath)
        extName = path.extname(filePath).toLowerCase()
        callback = @editors[extName]
        if callback isnt undefined
          return callback filePath

  @deactivate: ->
    @opener.dispose()