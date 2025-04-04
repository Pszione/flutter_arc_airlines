import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../../core/ui/ui.dart';
import '../../../../flights/data/data.dart';

class FlightInfoColumn extends StatelessWidget {
  final FlightInfoModel flight;
  final bool isDeparture;

  const FlightInfoColumn({super.key, required this.flight, required this.isDeparture});

  const FlightInfoColumn.departure({super.key, required this.flight}) : isDeparture = true;

  const FlightInfoColumn.arrival({super.key, required this.flight}) : isDeparture = false;

  @override
  Widget build(BuildContext context) {
    final flightTime = flight.getFlightTime(isDeparture);
    final flightTerminal = flight.getTerminal(isDeparture);

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
          'Terminal ${flightTerminal?.name ?? '-'}',
          style: context.textTheme.bodyMedium!.toColor(context.theme.dividerColor),
        ),
      ],
    );
  }
}
