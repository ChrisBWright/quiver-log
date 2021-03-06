// Copyright 2013 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library quiver.log.formatter_test;

import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:quiver_log/log.dart';
import 'package:unittest/unittest.dart';

main() {
  group('BasicLogFormatter', (){
     test('correctly formats LogRecord', (){
       LogRecord record =
           new LogRecord(Level.INFO, 'formatted message!', 'root');
       var dateFormat = new DateFormat("MMyy HH:mm:ss.S");
       var formatRegexp =
           new RegExp(r'\d\d \d\d:\d\d:\d\d.\d\d\d INFO \d root+ formatted message!');
       print(BASIC_LOG_FORMATTER.call(record));
       expect(BASIC_LOG_FORMATTER.call(record), matches(formatRegexp));
     });
  });
}
