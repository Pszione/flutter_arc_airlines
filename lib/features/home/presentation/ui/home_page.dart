import 'package:faker/faker.dart' show Faker; // TODO
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/ui/ui.dart';
import '../../../flights/data/data.dart';
import '../../home_imports.dart';

final double defaultPadding = 20.0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final child = Scaffold(
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
      body: _HomePageContent(),
    );

    return BlocProvider(create: (_) => HomeCubit()..fetchFlightData(), child: child);
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent({super.key});

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  @override
  Widget build(BuildContext context) {
    final bannerHeight = context.screenHeight * 0.22;
    final overflowBannerGap = bannerHeight - (defaultPadding * 2); // TODO: error handling

    return Stack(
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
                    trailing: BlocSelector<HomeCubit, HomeState, String?>(
                      selector: (state) => state.confirmationCode,
                      builder:
                          (context, confirmationCode) =>
                              Text(confirmationCode ?? 'N/A', style: context.textTheme.titleMedium),
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
                            // Performance: only rebuilds when departureFlightInfo changes
                            BlocSelector<HomeCubit, HomeState, FlightInfoModel>(
                              selector: (state) => state.departureFlightInfo,
                              builder: (context, flight) {
                                return FlightInfoColumn.departure(flight: flight);
                              },
                            ),
                            Icon(Icons.arrow_forward, size: 42),
                            // Performance: only rebuilds when departureFlightInfo changes
                            BlocSelector<HomeCubit, HomeState, FlightInfoModel>(
                              selector: (state) => state.arrivalFlightInfo,
                              builder: (context, flight) {
                                return FlightInfoColumn.arrival(flight: flight);
                              },
                            ),
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
                            BlocSelector<HomeCubit, HomeState, FlightInfoModel>(
                              selector: (state) => state.departureFlightInfo,
                              builder: (context, flight) {
                                final boardingTime = flight.getFlightBoardingTime();

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
                            BlocSelector<HomeCubit, HomeState, FlightInfoModel>(
                              selector: (state) => state.departureFlightInfo,
                              builder: (context, flight) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      flight.getTerminal(true)?.gate ?? '-',
                                      style:
                                          context.textTheme.headlineMedium!
                                              .copyWith(height: 1)
                                              .weightBold(),
                                    ),
                                    Text('Boarding Gate', style: context.textTheme.titleSmall),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () => context.read<HomeCubit>().refreshFlightData(),
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
    );
  }
}
