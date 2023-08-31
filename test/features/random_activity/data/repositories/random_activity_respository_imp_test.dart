import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failures.dart';
import 'package:clean_architecture/features/random_activity/data/datasource/random_activity_local_data_source.dart';
import 'package:clean_architecture/features/random_activity/data/datasource/random_activity_remote_data_source.dart';
import 'package:clean_architecture/features/random_activity/data/models/random_activity_model.dart';
import 'package:clean_architecture/features/random_activity/data/repositories/random_activity_repository_implementation.dart';
import 'package:clean_architecture/features/random_activity/domain/entities/random_activity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'random_activity_respository_imp_test.mocks.dart';


@GenerateMocks([
  RandomActivityRemoteDataSource,
  RandomActivityLocalDataSource,
  NetworkInfo
])
void main(){
late RandomActivityRepositoryImpl repository;
late MockRandomActivityRemoteDataSource mockRemoteDataSource;
late MockRandomActivityLocalDataSource mockLocalDataSource;
late MockNetworkInfo mockNetworkInfo;



setUp(() {
  mockRemoteDataSource = MockRandomActivityRemoteDataSource();
  mockLocalDataSource = MockRandomActivityLocalDataSource();
  mockNetworkInfo = MockNetworkInfo();

  repository = RandomActivityRepositoryImpl(
    remoteDataSource: mockRemoteDataSource, 
    localDataSource: mockLocalDataSource, 
    networkInfo: mockNetworkInfo);

});

const TestRandomActivityModel  = RandomActivityModel(
  activity: 'Go to the gym Twice ', 
  type: 'recreational', 
  participants: 1, 
  price: 1,
   link: '', 
  accessibility: 1);

  const RandomActivity testRandomActivity = TestRandomActivityModel;


  group('When Internet is active', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async=> true);
    });

    test('when internet is active , return a success random activity from remote datasource', () async {
 //setup

 when(mockRemoteDataSource.getRandomActivity()).thenAnswer((_) async=>TestRandomActivityModel);
 //do
 final result = await repository.getRandomActivity();
 //test

 expect(result, equals(const Right(testRandomActivity)));
    });
   });


   test('when Internet is active , return a server exception from remote datasource ', () async{
    //setup
    when(mockNetworkInfo.isConnected).thenAnswer((_) async=> true);

    when(mockRemoteDataSource.getRandomActivity()).thenThrow(ServerException());
    //do

    Either<Failure, RandomActivity?>?  result = await repository.getRandomActivity();
    //test

    expect(result, equals(const Left(ServerFailure(errorMessage: 'This is a server exception'))),
    );

   });



   group('when Internet is Not Active', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async=> false);
    });

    test('when the internet is not Active , return a random Activity from local datasource', ()async{
      //setup
      when(mockLocalDataSource.getLastRandomActivity()).
      thenAnswer((_) async=>  TestRandomActivityModel);
      //do

      final result = await repository.getRandomActivity();
      //test

      expect(result, equals(const Right(testRandomActivity)));
    } );
    });



    test('when internet is Not Active ,Throw cache from local datasource', () async{
      //setup 
      when(mockLocalDataSource.getLastRandomActivity())
      .thenThrow(CacheException());

      //do 
      final result = await repository.getRandomActivity();


      //test
      expect(result, equals(const Left(CacheFailure(errorMessage: 'this is a cache exception'))));
    });
}

