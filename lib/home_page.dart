import 'package:faker/faker.dart' show Faker; // TODO
import 'package:flutter/material.dart';
import 'package:flutter_arc_airlines/core/core.dart';

import 'core/ui/ui.dart';
import 'features/flights/data/data.dart';

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
                            children: [
                              FlightInfoColumn.departure(flight: flightInfo1),
                              Icon(Icons.arrow_forward, size: 42),
                              FlightInfoColumn.arrival(flight: flightInfo2),
                            ],
                          ),
                        ),
                        Divider(height: 0),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colorScheme.primary,
                              foregroundColor: context.colorScheme.onPrimary,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {},
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

class FlightInfoColumn extends StatelessWidget {
  final FlightInfoModel flight;
  final bool isDeparture;

  const FlightInfoColumn({super.key, required this.flight, required this.isDeparture});

  const FlightInfoColumn.departure({super.key, required this.flight}) : isDeparture = true;

  const FlightInfoColumn.arrival({super.key, required this.flight}) : isDeparture = false;

  @override
  Widget build(BuildContext context) {
    final flightTime = flight.getFlightTime(isDeparture);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          flight.getAirport(isDeparture),
          style: context.textTheme.headlineMedium!.copyWith(height: 1).weightBold(),
        ),
        Text(flight.flightNumber.value, style: context.textTheme.titleSmall),
        Gap(8),
        Text(
          // TODO: use Internationalization for conversion
          '${flightTime.hour}:${flightTime.minute}',
          style: context.textTheme.titleMedium!.weightSemiBold(),
        ),
        Text(
          // TODO: use Internationalization for conversion
          '${flightTime.month}/${flightTime.day}/${flightTime.year}',
          style: context.textTheme.bodyMedium!.toColor(context.theme.dividerColor),
        ),
        Text(
          // TODO: use Internationalization for conversion
          'Terminal 24',
          style: context.textTheme.bodyMedium!.toColor(context.theme.dividerColor),
        ),
      ],
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final EdgeInsetsGeometry? padding;
  final double? paddingMultiplier;

  const CustomChip({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.padding,
    this.paddingMultiplier,
  }) : assert(
         padding == null || paddingMultiplier == null,
         'You can user or padding or paddingMultiplier, but not both',
       ),
       assert(
         paddingMultiplier == null || paddingMultiplier > 0,
         'paddingMultiplier must be a positive number',
       );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const StadiumBorder(),
      child: Padding(
        padding:
            padding ??
            EdgeInsets.symmetric(
              vertical: 4.0 * (paddingMultiplier ?? 1),
              horizontal: 8.0 * (paddingMultiplier ?? 1),
            ),
        child: Text(text, style: TextStyle(color: textColor).weightSemiBold()),
      ),
    );
  }
}
