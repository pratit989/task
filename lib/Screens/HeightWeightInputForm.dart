import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/Screens/Result.dart';

class HeightWeightInputForm extends StatefulWidget {
  const HeightWeightInputForm({Key? key}) : super(key: key);

  @override
  State<HeightWeightInputForm> createState() => _HeightWeightInputFormState();
}

class _HeightWeightInputFormState extends State<HeightWeightInputForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late int height;
  late int weight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Height & Weight Arithmetic'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1, vertical: MediaQuery.of(context).size.height*0.1),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Height'),
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (val) {
                      if(val!.isEmpty) {
                        return 'Please input your height';
                      } else {
                        height = int.parse(val);
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        label: Text('Weight'),
                        border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (val) {
                      if(val!.isEmpty) {
                        return 'Please input your weight';
                      } else {
                        weight = int.parse(val);
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1,0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton.extended(
                      elevation: 5,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Result(weight: weight, height: height,)));
                        }
                      },
                      tooltip: 'Calculate', label: const Text('Calculate'), extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}