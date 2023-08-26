import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';

import '../models/random_activity_model.dart';


abstract class RandomActivityRemoteDataSource{
 Future<RandomActivityModel> getRandomActivity();
}

class RandomActivityRemoteDataSourceImp implements RandomActivityRemoteDataSource{
final Dio dio;  

RandomActivityRemoteDataSourceImp({required this.dio});

  @override
  Future<RandomActivityModel> getRandomActivity() async{
    final response = await dio.get('http://www.boredapi.com/api/activity');

    if(response.statusCode==200){
      return RandomActivityModel.fromJson(response.data);
    }
    else{
      throw ServerException();
    }
  }
}