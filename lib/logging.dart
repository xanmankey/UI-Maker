import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

/// A class for handling logging
class Logging {
  Logger logger = Logger("ui_maker");

  // A method for initializing Logger settings
  void initializeLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      dynamic e = record.error;
      String m = e.toString();
      debugPrint(
          '${record.loggerName}: ${record.level.name}: ${record.message} ${m != 'null' ? m : ''}');
    });
    Logger.root.info("Logging initialized.");
  }

  /// Simple return function
  Logger getLogger({bool initialize = false}) {
    if (initialize) {
      initializeLogging();
    }
    return logger;
  }
}

// logging instances
Logging logging = Logging();
Logger logger = logging.getLogger(initialize: true);
