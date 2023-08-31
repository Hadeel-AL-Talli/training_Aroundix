import 'package:clean_architecture/features/random_activity/display/provider/random_activity_provider.dart';
import 'package:clean_architecture/features/random_activity/display/provider/selected_page_provider.dart';
import 'package:clean_architecture/features/random_activity/display/widget/skeleton_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main(){
  testWidgets('When Menu Button Pressed, find the legalese text', (WidgetTester  tester)async {


//setup
await tester.pumpWidget(MyTestWidget());
Finder navigationMenuButton = find.byIcon(Icons.menu);
expect(navigationMenuButton, findsOneWidget);
//do
await tester.tap(navigationMenuButton);
await tester.pump();
Finder textlegalese = find.text('Legalese');
//test
expect(textlegalese, findsOneWidget);
  });
}


class MyTestWidget extends StatelessWidget {
  const MyTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SelectedPageProvider()),
        ChangeNotifierProvider(create: (context)=>RandomActivityProvider()),

      ],

      child: const MaterialApp(
        home: SkeletonWidget(),
      ),
    ); 
  }
}