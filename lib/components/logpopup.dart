library logpopup;

import 'package:polymer/polymer.dart';

// TODO:
// * Usage example / test page.
// * Help text.
// * Highlight matching regex for regex matches.
//   * Hover: highlight the matching filter.
// * Log entry view: filename, concise timestamp, etc.
//   * Click filename: only show this file.
//   * Before/after buttons for timestamps.
// * Expand stacktrace for log entry.
// * Store logging call site.
// * Reduce noise option. Hide log entries with this message / call site.
// * Resizable window.

/**
 * A LogPopup is a small button that hovers somewhere in your application.
 * Clicking on it opens a log window.
 */
@CustomTag("log-popup")
class LogPopup extends PolymerElement {
  /** The name of the log to listen to. Attribute. */
  @published String log = "";
  /** The width of the popped-out window in pixels. Attribute. */
  @published int windowWidth = 500;
  /** The height of the popped-out window in pixels. Attribute. */
  @published int windowHeight = 350;
  @observable bool expanded = false;
  @observable String logDisplay;
  @observable String title;
  @observable String windowPosition = "auto";
  @observable String buttonBottomRadius = '0.2em';
  @observable String toggleButtonWidth = "auto";
  String name;

  LogPopup.created() : super.created() {
    if (log == "") {
      name = "Logs";
    } else {
      name = log;
    }
    _display();
  }
  
  void toggle() {
    expanded = !expanded;
    windowWidth = windowWidth;
    windowHeight = windowHeight;
    _display();
  }

  void _display() {
    if (expanded) {
      logDisplay = "block";
      title = "[-] $name";
      // -8px to account for a 4px border on each side.
      toggleButtonWidth = "${windowWidth - 8}px";
      buttonBottomRadius = '0em';
    } else {
      logDisplay = "none";
      title = "[+] $name";
      toggleButtonWidth = "auto";
      // Curved button corners are important.
      buttonBottomRadius = '0.2em';
    }
  }
}