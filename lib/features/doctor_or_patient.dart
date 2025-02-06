import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';

class DoctorOrPatient extends StatelessWidget {
  const DoctorOrPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('Doctor'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.homeUser);
            },
            child: Text('User'),
          ),
        ],
      ),
    ));
  }
}
