
import 'dart:convert';

import 'package:clean_architecture/features/random_activity/data/datasource/random_activity_local_data_source.dart';
import 'package:clean_architecture/features/random_activity/data/models/random_activity_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../testing_data/get_string.dart';
import 'random_activity_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  //! Create the variables


late MockSharedPreferences mockSharedPreferences;
 late RandomActivityLocalDataSourceImpl dataSource;


  setUp(() {
    //! Setup the variables
mockSharedPreferences = MockSharedPreferences();
dataSource  = RandomActivityLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
   

  });
   final testRandomActivityModel = RandomActivityModel.fromJson(
      json.decode(getString('random_activity.json')));
  test(
    'This should return a Random Activity from the cache of the SharedPreference. Use a Mock SharedPreference',
    () async {
      //setup
     when(mockSharedPreferences.getString(any)).thenReturn(getString('random_activity.json'));
      //do
      final result = await dataSource.getLastRandomActivity();
      //test
    verify(mockSharedPreferences.getString(cachedRandomActivity));

    expect(result, equals(testRandomActivityModel));
    },
  );
}