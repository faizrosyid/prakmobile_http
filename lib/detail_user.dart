import 'package:flutter/material.dart';
import 'users_model.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height/3,
                child: Image.network(),
              ),
              Text(),
            ],
          ),
        ),
      ),
    );
  }
}
