import 'package:flutter/material.dart';
import 'package:mdsflutter_example/AppModel.dart';
import 'package:provider/provider.dart';

import 'ScanWidget.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => AppModel(),
        child: MaterialApp(
          home: ScanWidget(),
        ),
      )
  );
}
