import 'package:clean_architecture/features/random_activity/data/models/random_activity_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  const testRandomActivityModel = RandomActivityModel(
    activity: 'Go to the gym',
    type: 'recreational',
    participants: 1,
    price: 1,
    link: '',
    key: '123456789',
    accessibility: 1,
    );


    test('Expect a json with the good data', ()async{
    //setup
    final expectedMap = {
       "activity": "Go to the gym",
            "type": "recreational",
            "participants": 1,
            "price": 1,
            "link": "",
            "accessibility": 1,
    };
    //do

    final result = testRandomActivityModel.toJson();
    //test

    expect(result, expectedMap);
    });
}