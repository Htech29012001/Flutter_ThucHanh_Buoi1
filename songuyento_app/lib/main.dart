import 'package:flutter/material.dart';

void main() {
  runApp(PrimeCheckerApp());
}

class PrimeCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeCheckerScreen(),
    );
  }
}

class PrimeCheckerScreen extends StatefulWidget {
  @override
  _PrimeCheckerScreenState createState() => _PrimeCheckerScreenState();
}

class _PrimeCheckerScreenState extends State<PrimeCheckerScreen> {
  int _number = 0;
  bool _isPrime = false;

  void _checkPrime() {
    setState(() {
      _isPrime = isPrime(_number);
    });
  }

  bool isPrime(int number) {
    if (number < 2) {
      return false;
    }

    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kiểm Tra Số Nguyên Tố App Thanh Tam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nhập 1 số bất kì:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _number = int.tryParse(value) ?? 0;
                  });
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: () {
                  _checkPrime();
                },
                child: const Text('Kiểm Tra'),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              _isPrime
                  ? '$_number là số nguyên tố.'
                  : '$_number không là số nguyên tố.',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
