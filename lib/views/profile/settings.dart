import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_meet_flutter/core/components/custom_app_bar.dart';
import 'package:med_meet_flutter/core/components/custom_button.dart';
import 'package:med_meet_flutter/core/helpers/route.dart';
import 'package:med_meet_flutter/core/utils/uitls.dart';
import 'package:med_meet_flutter/models/options.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var options = [
      Options(
        name: "Change Password",
        icon: "assets/svg/change_password.svg",
        link: AppRoutes.changePassword,
      ),
      Options(
        name: "Privacy Policy",
        icon: "assets/svg/privacy_policy.svg",
        link: AppRoutes.privaryPolicy,
      ),
      Options(
        name: "Terms of Services",
        icon: "assets/svg/terms_of_services.svg",
        link: AppRoutes.termsOfServices,
      ),
      Options(
        name: "About Us",
        icon: "assets/svg/about_us.svg",
        link: AppRoutes.aboutUs,
      ),
      Options(
          name: "Delete Account",
          icon: "assets/svg/delete_account.svg",
          link: null),
    ];

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Settings",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    // const SizedBox(
                    //   height: 4,
                    // ),
                    ...options.map(
                      (e) {
                        return GestureDetector(
                          onTap: () {
                            if (e.link != null) {
                              Get.toNamed(e.link!);
                            } else if (e.name == "Delete Account") {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width -
                                      //     48,
                                      padding: EdgeInsets.only(
                                        top: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xffE8E8E8),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: 3,
                                            width: 40,
                                            color: Color(0xffE8E8E8),
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            "Delete Account",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xffDD3663),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Divider(
                                            color: Color(0xffDDDEE0),
                                          ),
                                          SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 24,
                                            ),
                                            child: Text(
                                              "Are you sure you want to delete your Account?",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff545454),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Row(
                                            children: [
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: CustomButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  buttonTitle: "Cancel",
                                                  height: 48,
                                                  isSecondary: true,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: CustomButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  buttonTitle: "Yes, Delete",
                                                  height: 48,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                svgViewer(
                                  asset: e.icon!,
                                  color: Color(0xff545454),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  e.name,
                                  style: TextStyle(
                                    color: Color(0xff545454),
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                if (e.name != "Delete Account")
                                  Transform.flip(
                                    flipX: true,
                                    child: svgViewer(
                                      asset: "assets/svg/arrow_back.svg",
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
