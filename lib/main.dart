import 'package:bloc_demo/bloc_counter/counter_bloc.dart';
import 'package:bloc_demo/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 213, 175),
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bloc Demo",
            style: TextStyle(
              color: Colors.purple[800],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Count on ${state.count}',
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const DetailsScreen());
              },
              child: const Icon(Icons.person_3_rounded),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Decrement());
            },
            tooltip: 'Decrement',
            backgroundColor: Colors.orange[200],
            child: Icon(
              Icons.remove,
              color: Colors.purple[800],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
            tooltip: 'Increment',
            backgroundColor: Colors.orange[200],
            child: Icon(
              Icons.add,
              color: Colors.purple[800],
            ),
          ),
        ],
      ),
    );
  }
}
