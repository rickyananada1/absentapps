import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';
import '../../utils/common.dart';
import '../../utils/images.dart';
import '../controllers/auth_controller.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment>
    with AutomaticKeepAliveClientMixin<ProfileFragment> {
  @override
  bool get wantKeepAlive => true;
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    authController.getProfile();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: authController.getProfile(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: appColorPrimary,
              size: 30,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile', style: boldTextStyle(size: 20)),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          CommonCachedNetworkImage(ic_profile,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                              radius: 75),
                          16.height,
                          Text(authController.user.value!.EmployeeName!,
                              style: boldTextStyle()),
                          8.height,
                          Text(authController.user.value!.Position!,
                              style: secondaryTextStyle()),
                          8.height,
                          authController
                                      .user.value!.IsAllowFingerfromAnywhere ??
                                  false
                              ? const Text('Finger from Anywhere',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center)
                              : const SizedBox(),
                        ],
                      ).paddingOnly(top: 24, bottom: 24),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Profile Saya',
                          style: boldTextStyle(size: 16),
                        ),
                      ).paddingOnly(left: 16),
                      const Divider(thickness: 0.5, color: Colors.grey),
                      // NIP
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.person),
                        title: authController.user.value!.NIP!,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      // Position and date joined
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.person),
                        title: authController.user.value!.Position!,
                        subTitle: DateFormat('dd MMM yyyy').format(
                            DateTime.parse(authController.user.value!.DoH!)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      // office
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.location_on),
                        title: "Office",
                        subTitle: authController.user.value!.Office!,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      // department
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.location_city),
                        title: "Department",
                        subTitle: authController.user.value!.Department!,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      const Divider(thickness: 0.5, color: Colors.grey),
                      // perangkat terdaftar
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.devices),
                        title: "Perangkat Terdaftar",
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: Colors.green,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                          ),
                          child:
                              const Icon(Icons.check, color: white, size: 16),
                        ),
                        onTap: () {
                          toast("Perangkat Terdaftar");
                        },
                      ),
                      // ganti bahasa
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.language),
                        title: "Ganti Bahasa",
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        subTitle: "Bahasa Indonesia",
                        trailing: trailing,
                        onTap: () {
                          toast("Ganti Bahasa");
                        },
                      ),
                      SettingItemWidget(
                        leading: settingIconWidget(icon: Icons.notifications),
                        title: "Notification",
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        trailing: trailing,
                        onTap: () {
                          toast("Notification");
                        },
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              barrierColor: Colors.black.withOpacity(0.5),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Container();
                              },
                              barrierDismissible: true,
                              barrierLabel: '',
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              transitionBuilder:
                                  (_, animation, secondaryAnimation, child) {
                                return dialogAnimatedWrapperWidget(
                                  animation: animation,
                                  dialogAnimation:
                                      DialogAnimation.SLIDE_BOTTOM_TOP,
                                  curve: Curves.fastOutSlowIn,
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    titlePadding: EdgeInsets.zero,
                                    backgroundColor: _.cardColor,
                                    elevation: defaultElevation.toDouble(),
                                    title: buildTitleWidget(
                                      _,
                                      DialogType.CONFIRMATION,
                                      appColorPrimary,
                                      null,
                                      140,
                                      220,
                                      null,
                                      null,
                                    ).cornerRadiusWithClipRRectOnly(
                                        topLeft: defaultRadius.toInt(),
                                        topRight: defaultRadius.toInt()),
                                    content: Container(
                                      width: 220,
                                      color: Colors.transparent,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Anda yakin ingin keluar?',
                                            style: boldTextStyle(size: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                          16.height,
                                          Row(
                                            children: [
                                              AppButton(
                                                elevation: 0,
                                                shapeBorder:
                                                    RoundedRectangleBorder(
                                                  borderRadius: radius(
                                                      defaultAppButtonRadius),
                                                  side: const BorderSide(
                                                      color: viewLineColor),
                                                ),
                                                color: _.cardColor,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      color:
                                                          textPrimaryColorGlobal,
                                                      size: 20,
                                                    ),
                                                    6.width,
                                                    Text(
                                                      'Cancel',
                                                      style: boldTextStyle(
                                                          color:
                                                              textPrimaryColorGlobal),
                                                    ),
                                                  ],
                                                ).fit(),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ).expand(),
                                              16.width,
                                              AppButton(
                                                elevation: 0,
                                                color: getDialogPrimaryColor(
                                                    _,
                                                    DialogType.CONFIRMATION,
                                                    appColorPrimary),
                                                shapeBorder:
                                                    RoundedRectangleBorder(
                                                  borderRadius: radius(
                                                      defaultAppButtonRadius),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    getIcon(DialogType
                                                        .CONFIRMATION),
                                                    6.width,
                                                    Text(
                                                      getPositiveText(DialogType
                                                          .CONFIRMATION),
                                                      style: boldTextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ).fit(),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  // call the api
                                                  await authController.logout();
                                                },
                                              ).expand(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            alignment: Alignment.center,
                            width: 170,
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: appColorPrimary,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.logout,
                                    color: white, size: 24),
                                8.width,
                                Text('Keluar',
                                    style: boldTextStyle(color: white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
