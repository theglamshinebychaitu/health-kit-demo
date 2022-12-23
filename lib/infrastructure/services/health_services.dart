import 'package:health/health.dart';

class HealthService {
  static HealthFactory health = HealthFactory();

  static Future<List<HealthDataPoint>> fetchHealthData() async {
    final types = [
      HealthDataType.STEPS,
      HealthDataType.SLEEP_IN_BED,
    ];

    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    final now = DateTime.now();

    final yesterday = now.subtract(const Duration(days: 1));

    List<HealthDataPoint> healthData = [];

    bool requested = await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      healthData = await health.getHealthDataFromTypes(yesterday, now, types);

    } else {
      throw AuthenticationRequired();
    }
    return healthData;
  }
}

class AuthenticationRequired extends Error {}