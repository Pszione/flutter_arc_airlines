part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final String? errorMessage;
  final FlightInfoModel departureFlightInfo;
  final FlightInfoModel arrivalFlightInfo;
  final String? confirmationCode;

  const HomeState({
    this.status = HomeStatus.initial,
    this.errorMessage,
    required this.departureFlightInfo,
    required this.arrivalFlightInfo,
    required this.confirmationCode,
  });

  factory HomeState.initial() => HomeState(
    status: HomeStatus.initial,
    departureFlightInfo: FlightInfoModel.empty(),
    arrivalFlightInfo: FlightInfoModel.empty(),
    confirmationCode: null,
  );

  factory HomeState.error({
    required String? errorMessage,
    FlightInfoModel? departureFlightInfo,
    FlightInfoModel? arrivalFlightInfo,
    String? confirmationCode,
  }) => HomeState(
    status: HomeStatus.error,
    errorMessage: errorMessage,
    departureFlightInfo: departureFlightInfo ?? FlightInfoModel.empty(),
    arrivalFlightInfo: arrivalFlightInfo ?? FlightInfoModel.empty(),
    confirmationCode: confirmationCode,
  );

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    FlightInfoModel? departureFlightInfo,
    FlightInfoModel? arrivalFlightInfo,
    String? confirmationCode,
  }) => HomeState(
    status: status ?? this.status,
    errorMessage: errorMessage ?? this.errorMessage,
    departureFlightInfo: departureFlightInfo ?? this.departureFlightInfo,
    arrivalFlightInfo: arrivalFlightInfo ?? this.arrivalFlightInfo,
    confirmationCode: confirmationCode ?? this.confirmationCode,
  );

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    departureFlightInfo,
    arrivalFlightInfo,
    confirmationCode,
  ];
}
