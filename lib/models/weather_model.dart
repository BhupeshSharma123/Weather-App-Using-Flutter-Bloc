// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final double currenttemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  WeatherModel({
    required this.currenttemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  });

  WeatherModel copyWith({
    double? currenttemp,
    String? currentSky,
    double? currentPressure,
    double? currentWindSpeed,
    double? currentHumidity,
  }) {
    return WeatherModel(
      currenttemp: currenttemp ?? this.currenttemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currenttemp': currenttemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeatherData = map['list'][0];
    return WeatherModel(
      currenttemp: currentWeatherData['main']['temp'],
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentHumidity: currentWeatherData['main']['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currenttemp: $currenttemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currenttemp == currenttemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity;
  }

  @override
  int get hashCode {
    return currenttemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode;
  }
}
