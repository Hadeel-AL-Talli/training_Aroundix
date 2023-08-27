import 'dart:io';

String getString(String fileName) => File('test/get_string/$fileName').readAsStringSync();