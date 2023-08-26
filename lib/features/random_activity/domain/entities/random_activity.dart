import 'package:equatable/equatable.dart';

class RandomActivity extends Equatable{
  final String activity; 
  final String type; 
  final int participants;
  final String link;
  final double price; 
  final String? key; 
  final double accessibility;


  const RandomActivity({required this.activity, 
  required this.type,
   required this.participants,
    required this.price, 
    required this.link,
    this.key, 
    required this.accessibility
    });
    
      @override
      // TODO: implement props
      List<Object?> get props => [activity,type, participants,price,link,key,accessibility];
}