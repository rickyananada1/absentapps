import 'package:absentapps/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final key = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: key,
      // autoScrollDuration: 3000,
      // infiniteAutoScroll: true,
      allowImplicitScrolling: true,
      safeAreaList: const [true, true, true, true],
      globalFooter: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 60,
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            Get.offNamed('/login');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: appColorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Mulai',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: 'Astina Absensi Online',
          body:
              'Astina Absensi Online merupakan aplikasi absensi online karyawan yang bisa dilakukan di mana saja dan kapan saja',
          image: Image.asset('assets/images/image1.png'),
          decoration: const PageDecoration(
            safeArea: 0,
            titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        PageViewModel(
          title: 'Absen Kapan Saja dan Dimana Saja',
          body:
              'Absen menggunakan ponsel yang mencocokkan wajah pengguna dan lokasi pengguna melakukan absensi',
          image: Image.asset('assets/images/image2.png'),
          decoration: const PageDecoration(
            safeArea: 0,
            titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        PageViewModel(
          title: 'Laporan Presensi',
          body:
              'Dapatkan laporan terkait presensi yang dilakukan secara terperinci',
          image: Image.asset('assets/images/image4.png'),
          decoration: const PageDecoration(
            safeArea: 0,
            titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        PageViewModel(
          title: 'Pengajuan Izin dan Cuti',
          body:
              'Pengajuan yang dilakukan secara digital dan pantau persetujuan maupun penolakan melalui notifikasi',
          image:
              Image.asset('assets/images/image3.png', height: 500, width: 500),
          decoration: const PageDecoration(
            safeArea: 0,
            titleTextStyle: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      controlsMargin: EdgeInsets.zero,
      showDoneButton: false,
      showSkipButton: false,
      showNextButton: false,
    );
  }
}
