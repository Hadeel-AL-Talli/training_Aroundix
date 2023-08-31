import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String? errorMessage;
  const Failure({required this.errorMessage});

 

}

class ServerFailure extends Failure{
   const ServerFailure({required String? errorMessage}) : super(errorMessage: errorMessage);
   
     @override
     // TODO: implement props
     List<Object?> get props => [errorMessage];
}

class CacheFailure extends Failure{
 const CacheFailure({required String? errorMessage}): super(errorMessage: errorMessage);
 
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}