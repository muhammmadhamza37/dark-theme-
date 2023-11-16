import 'package:flutter/material.dart';
import 'package:prov/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {

  @override
  Widget build(BuildContext context) {

    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('ExampleOne'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ExampleOneProvider>(builder: (context , value, child){
              return  Slider(
                  min: 0,
                  max: 1,
                  value: value.value, onChanged: (val){
                value.setValue(val);
              });
            }),
            Consumer<ExampleOneProvider>(builder: (context , value, child){
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(value.value)
                      ),
                      child: Center(child: Text('Container 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(value.value)
                      ),
                      child: Center(child: Text('Container 2')),
                    ),
                  ),

                ],
              );

            }),

          ],
        ),
      ),
      
    );
  }
}
