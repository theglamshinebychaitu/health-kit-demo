import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_health/infrastructure/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Obx(() {
        return homeController.isLoading.value
            ? const CircularProgressIndicator()
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Step count",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                SizedBox(
                  height: 300.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.stepList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Text("Step:- ${homeController.stepList[index].value}"),
                              Text("Date From:- ${homeController.stepList[index].dateFrom}"),
                              Text("Date To:- ${homeController.stepList[index].dateTo}"),
                            ],
                          ),
                        );
                      }),
                ),
                const Text(
                  "Sleep data",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.sleepList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              Text("Sleep:- ${homeController.sleepList[index].value}"),
                              Text("Date From:- ${homeController.sleepList[index].dateFrom}"),
                              Text("Date To:- ${homeController.sleepList[index].dateTo}"),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
      }),
    );
  }
}
