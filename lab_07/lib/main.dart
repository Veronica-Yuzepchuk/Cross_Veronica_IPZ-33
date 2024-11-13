import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
          backgroundColor: Colors.purple[100],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: CornerConfigurator(),
        ),
      ),
    );
  }
}

class CornerConfigurator extends StatefulWidget {
  const CornerConfigurator({super.key});

  @override
  CornerConfiguratorState createState() => CornerConfiguratorState();
}

class CornerConfiguratorState extends State<CornerConfigurator> {
  double topLeft = 50.0;
  double topRight = 50.0;
  double bottomLeft = 50.0;
  double bottomRight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                buildSlider("TL", topLeft, (value) {
                  setState(() {
                    topLeft = value;
                  });
                }),
                buildSlider("BL", bottomLeft, (value) {
                  setState(() {
                    bottomLeft = value;
                  });
                }),
              ],
            ),
            Column(
              children: [
                buildSlider("TR", topRight, (value) {
                  setState(() {
                    topRight = value;
                  });
                }),
                buildSlider("BR", bottomRight, (value) {
                  setState(() {
                    bottomRight = value;
                  });
                }),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text("$label: ${value.toStringAsFixed(2)}"),
        Slider(
          value: value,
          min: 0,
          max: 100,
          onChanged: onChanged,
          activeColor: Colors.purple,
        ),
      ],
    );
  }
}
