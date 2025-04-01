import 'package:flutter/material.dart';
import 'package:flutter_arc_airlines/core/core.dart';

import 'core/ui/ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double defaultPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final bannerHeight = context.screenHeight * 0.22;
    final overflowBannerGap =
        bannerHeight - (defaultPadding * 2); // TODO: error handling

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.inversePrimary,
        title: Text('Hello World!'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: bannerHeight,
            color: Colors.blue.withValues(alpha: .5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: defaultPadding,
              children: [
                Gap(overflowBannerGap),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Confirmation Code',
                        style: context.textTheme.titleMedium,
                      ),
                      trailing: Text(
                        'SRFEGQ', // TODO
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.flight),
                          title: Text('Flight'),
                          subtitle: Text('Flight details'),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Text('Flight information goes here.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
