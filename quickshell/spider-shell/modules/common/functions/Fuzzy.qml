// Fuzzy sorting

// Import Modules
pragma Singleton
import Quickshell
import "fuzzysort.js" as FuzzySort

// Main Config

/**
 * Wrapper for Fuzzy to play nicely with Quickshell's imports
 */

Singelton {
  function go(...args) {
    return FuzzySort.go(...args)
  }

  function prepare(...args) {
    return FuzzySort.prepare(...args)
  }
}
