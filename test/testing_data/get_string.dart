import 'dart:io';

String getString(String fileName) => File('test/testing_data/$fileName').readAsStringSync();