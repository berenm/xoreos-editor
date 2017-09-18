/** @babel */

import ArchiveFileEditor from '../../core/archive-file-editor'
import {PCK} from './pck'

class PCKEditor extends ArchiveFileEditor {
  static deserialize({path}) { if (path) return new PCKEditor({path: path}) }
  static get version() { return 1 }
  serialize() { return { deserializer: 'PCKEditor', version: PCKEditor.version, path: this.path } }
  isEqual(other) { return other instanceof PCKEditor && (this.getURI() === other.getURI()) }

  constructor({path}) { super({path: path, parser: PCK}) }
}

atom.deserializers.add(PCKEditor)
export default PCKEditor