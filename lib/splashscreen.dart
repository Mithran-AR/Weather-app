import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialdata();
  }

  Future<void>_initialdata()async{
    print("good");
    await Future.delayed(Duration(seconds: 1));
    getdata();
    await Future.delayed(Duration(seconds: 1));
    getimages();
    await Future.delayed(Duration(seconds: 1));
  }
  Future<void>getdata()async{
    print("good");
  }
  Future<void>getimages()async{
    print("good");
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      )

    );
  }
}
