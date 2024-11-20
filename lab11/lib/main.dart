import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContainerModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Page'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ConfiguratorScreen(),
      ),
    );
  }
}

class ContainerModel extends ChangeNotifier {
  double width = 100;
  double height = 100;
  double radius = 0;

  void setWidth(double value) {
    width = value;
    notifyListeners();
  }

  void setHeight(double value) {
    height = value;
    notifyListeners();
  }

  void setRadius(double value) {
    radius = value;
    notifyListeners();
  }
}

class ConfiguratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SliderSection(),
          SizedBox(height: 20),
          ContainerSection(),
        ],
      ),
    );
  }
}

class SliderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ContainerModel>(context);
    return Column(
      children: [
        SliderTile(
          label: 'Width',
          value: model.width,
          onChanged: (val) => model.setWidth(val),
          max: 100,
        ),
        SliderTile(
          label: 'Height',
          value: model.height,
          onChanged: (val) => model.setHeight(val),
          max: 100,
        ),
        SliderTile(
          label: 'Radius',
          value: model.radius,
          onChanged: (val) => model.setRadius(val),
          max: 100,
        ),
      ],
    );
  }
}

class ContainerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ContainerModel>(context);
    return Center(
      child: Container(
        width: model.width,
        height: model.height,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(model.radius),
          ),
        ),
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String label;
  final double value;
  final ValueChanged<double> onChanged;
  final double max;

  const SliderTile({
    required this.label,
    required this.value,
    required this.onChanged,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ${value.toStringAsFixed(2)}'),
          Slider(
            value: value,
            onChanged: onChanged,
            min: 0,
            max: max,
          ),
        ],
      ),
    );
  }
}
