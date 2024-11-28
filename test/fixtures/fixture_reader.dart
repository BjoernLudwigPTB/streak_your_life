import 'dart:io' show File;

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
