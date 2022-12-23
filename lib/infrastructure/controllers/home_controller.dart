import 'package:flutter_health/infrastructure/services/health_services.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class HomeController extends GetxController {
  List<HealthDataPoint> healthPoint = <HealthDataPoint>[].obs;
  List<HealthDataPoint> stepList = <HealthDataPoint>[].obs;
  List<HealthDataPoint> sleepList = <HealthDataPoint>[].obs;
  var error = "".obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  void fetchHealthData() async {
    try {
      isLoading.value = true;
      final healthData = await HealthService.fetchHealthData();
      healthPoint.assignAll(healthData);
      healthPoint.forEach((element) {
        if(element.type == HealthDataType.STEPS){
          stepList.add(element);
        } else if(element.type == HealthDataType.SLEEP_IN_BED) {
          sleepList.add(element);
        }
      });
      error.value = "";
      isLoading.value = false;
    } catch (e) {
      error.value = e.toString();
    }
    update();
  }

}