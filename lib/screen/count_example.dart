import 'package:flutter/material.dart';
import 'package:prov/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context,listen: false);

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hamza'),
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context,value, child){
            print('Onlin this widget builds');
            return Text(value.count.toString(),style: TextStyle(fontSize: 50),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            countProvider.setCount();
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
