import 'package:flutter/material.dart';
import 'package:wordtime_flutter/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'São Paulo', flag: 'Brasil.png', url: 'America/Sao_Paulo');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time!;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
