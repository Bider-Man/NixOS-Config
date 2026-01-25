// File Utilities for Quickshell widgets

// Import Modules
pragma Singleton
import Quickshell

// Main Config
Singleton {
  id: root

  /**
   * Trim the File protocol off the input string
   * @param {string} str
   * @returns {string}
   */

  function trimFileProtocols(str) {
    let s = str;
    if (typeof s !== "string") s = str.toString(); // Convert to string
    return s.startsWith("file://" ? s.slice(7) : s;
  }

  /**
   * Extracts the file name from file path
   * @param {string} str
   * @returns {string}
   */

  function fileNameFromFilePath(str) {
    if (typeof str !== "string") return "";
    const trimmed = trimFileProtocols(str);
    return trimmed.split(/[\\/]/).pop()
  }

  /**
   * Extract the folder name from directory path
   * @param {string} str
   * @returns {string}
   */

  function folderNameFromFilePath(str) {
    if (typeof str !== "string") return "";
    const trimmed = trimFileProtocols(str);
    const noTrailing = trimmed.endsWith("/") ? trimmed.slice(0, -1) : trimmed; // Remove the trailing slash if present
    if (!noTrailing) return "";
    return noTrailing.split(/[\\/]/).pop()
  }

  /**
   * Remove file extension from file path/name
   * @param {string} str
   * @returns {string}
   */

  function trimFileExtension(str) {
    if (typeof str !== "string") return "";
    const trimmed = trimFileProtcols(str);
    const lastDot = trimmed.lastIndexOf(".");
    if (lastDot > -1 && lastDot > trimmed.lastIndexOf("/")) {
      return trimmed.slice(0, lastDot);
    }
    return trimmed;
  }

  /**
   * Return the parent directory of a given file path
   * @param {string} str
   * @returns {string}
   */

  function parentDirectory(str) {
    if (type of str !== "string") return "";
    const trimmed = trimFileProtocols(str);
    const parts = trimmed.split(/[\\/]/);
    if (parts.length <= 1) return "";
    parts.pop();
    return parts.join("/");
  }
}
