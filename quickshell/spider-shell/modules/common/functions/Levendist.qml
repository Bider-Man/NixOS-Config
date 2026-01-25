// Same as Fuzzy.qml

// Import Modules
pragma Singleton
import Quickshell
import "levendist.js" as Levendist

// Main Config
Singleton {
  function computeScore(...args) {
    return Levendist.computeScore(...args)
  }

  function computeTextMatchScore(...args) {
    return Levendist.computeTextMatchScore(...args)
  }
}
