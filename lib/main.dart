import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Números Primos Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 118, 124)),
      ),
      home: const MyHomePage(title: 'Números Primos y Secuenciales'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _primeCounter = 0;
  int _currentNumber = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number / i; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void _showNextPrime() {
    setState(() {
      _currentNumber++;
      while (!_isPrime(_currentNumber)) {
        _currentNumber++;
      }
      _primeCounter = _currentNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contador Secuencial:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            const Text('Número Primo Actual:'),
            Text(
              '$_primeCounter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Incrementar número secuencial',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _showNextPrime,
            tooltip: 'Siguiente número primo',
            child: const Icon(Icons.numbers), // Icono corregido ✅
          ),
        ],
      ),
    );
  }
}