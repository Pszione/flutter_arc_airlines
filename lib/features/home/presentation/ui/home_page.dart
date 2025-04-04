import 'package:faker/faker.dart' show Faker; // TODO
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/ui/ui.dart';
import '../../../flights/data/data.dart';
import '../../home_imports.dart';

final FlightInfoModel flightInfo1 = FlightInfoFaker.call();
final FlightInfoModel flightInfo2 = FlightInfoFaker.call();

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
    final overflowBannerGap = bannerHeight - (defaultPadding * 2); // TODO: error handling

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        surfaceTintColor: Colors.transparent,
        title: Text('Hello World!'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDarkMode = state.themeMode == ThemeMode.dark;
              return IconButton(
                icon: Icon(isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round),
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                tooltip: 'Toggle light/dark theme',
              );
            },
          ),
        ],
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
                    surfaceTintColor: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        'Confirmation Code',
                        style: context.textTheme.titleMedium!.weightSemiBold(),
                      ),
                      trailing: Text(
                        Faker().stringFromWords(5).toString(), // TODO
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
                          title: Text('Flight Details'),
                          trailing: CustomChip(
                            text: 'On Time',
                            color: Colors.green.shade300,
                            textColor: context.colorScheme.onInverseSurface,
                          ),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlightInfoColumn.departure(flight: flightInfo1),
                              Icon(Icons.arrow_forward, size: 42),
                              FlightInfoColumn.arrival(flight: flightInfo2),
                            ],
                          ),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                          ).copyWith(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // TODO: use Internationalization for conversion
                              Builder(
                                builder: (context) {
                                  final boardingTime = flightInfo1.getFlightBoardingTime();

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        // TODO: use Internationalization for conversion
                                        '${boardingTime.hour}:${boardingTime.minute}',
                                        style:
                                            context.textTheme.headlineMedium!
                                                .copyWith(height: 1)
                                                .weightBold(),
                                      ),
                                      Text('Boarding Time', style: context.textTheme.titleSmall),
                                    ],
                                  );
                                },
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    flightInfo1.getTerminal(true)?.gate ?? '-',
                                    style:
                                        context.textTheme.headlineMedium!
                                            .copyWith(height: 1)
                                            .weightBold(),
                                  ),
                                  Text('Boarding Gate', style: context.textTheme.titleSmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colorScheme.primary,
                              foregroundColor: context.colorScheme.onPrimary,
                              textStyle: context.textTheme.titleMedium!.weightBold(),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            child: Text('See Boarding Pass'),
                          ),
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
