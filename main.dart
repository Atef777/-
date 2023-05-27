import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // مبلغ الأموال الحالي للمستخدم
  double _balance = 1000.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'التطبيق المصرفي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('التطبيق المصرفي'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الرصيد الحالي:',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                '$_balance ريال',
                style: TextStyle(fontSize: 36.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // قم بخصم المبلغ المراد من الرصيد الحالي
                  _deductAmount(100.0);
                },
                child: Text('اخصم 100 ريال'),
              ),
              ElevatedButton(
                onPressed: () {
                  // قم بإضافة المبلغ المراد إلى الرصيد الحالي
                  _addAmount(200.0);
                },
                child: Text('اضف 200 ريال'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deductAmount(double amount) {
    if (_balance >= amount) {
      // خصم المبلغ من الرصيد
      _balance -= amount;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('تمت العملية بنجاح'),
            content: Text('$amount ريال تم خصمها من الرصيد الحالي.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('حسنًا'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('فشلت العملية'),
            content: Text('الرصيد الحالي غير كافٍ.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('حسنًا'),
              ),
            ],
          );
        },
      );
    }
  }

  void _addAmount(double amount) {
    // إضافة المبلغ إلى الرصيد
    _balance += amount;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('تمت العملية بنجاح'),
          content: Text('$amount ريال تمت إضافتها إلى الرصيد الحالي.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }
}
