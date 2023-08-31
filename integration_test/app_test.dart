import 'package:clean_architecture/features/random_activity/display/widget/custom_elevated_button_widget.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
testWidgets('Full app test', (WidgetTester tester)async {
  //setup
  await tester.pumpWidget(const MyApp());
  //do

  // click and Go in the Home Page
  Finder customButton = find.byKey(customButtonKey);
  expect(customButton, findsOneWidget);
  tester.printToConsole('Custom button found');
  await tester.tap(customButton);
  await tester.pump(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));



  //click randomActivity button 
  Finder customButtonHome = find.byKey(customButtonKey);
  expect(customButtonHome, findsOneWidget);
  tester.printToConsole('Custom Button Home Found');
  await tester.tap(customButtonHome);
  await tester.pump(const Duration(seconds: 1));

  await Future.delayed(const Duration(seconds: 1));

  // click the menu icon and go in the second page 
  Finder menuButton  = find.byIcon(Icons.menu);
  expect(menuButton, findsOneWidget);
  tester.printToConsole('menu button found');
  await tester.tap(menuButton);
  await tester.pump(const Duration(seconds: 1));


  // verify that we found the second page 
  Finder textLegalese = find.text('Legalese');
  expect(textLegalese, findsOneWidget);
  tester.printToConsole('Legalese Text found');



  //click on the app Bar Button 
  Finder actionButton = find.byIcon(Icons.flash_on_outlined);
  expect(actionButton, findsOneWidget); 
  tester.printToConsole('flash button found');
  await tester.tap(actionButton);
  await tester.pump(Duration(seconds: 1));

  await Future.delayed(const Duration(seconds: 2));
});
}