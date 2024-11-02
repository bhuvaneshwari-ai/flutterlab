import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(title: Text('Flutter Form Example')),
        body: MyForm(),
      ),
    );
  }
}
class MyForm extends StatefulWidget{
  @override
  _MyFormState createState()=>_MyFormState();
}
class _MyFormState extends State<MyForm>{
  final _formKey=GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _gender;
bool _isTermsAccepted=false;
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key:_formKey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter your name';
                }
                return null;
              },
              onSaved:(value){
                _name=value;
              },
            ),
  
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter your email';
                }
                if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                  return 'please enter a valid email address';
                }
                return null;
              },
              onSaved:(value){
                _email=value;
              },
            ),
            SizedBox(height: 16),
            Text('Gender',style:TextStyle(fontSize: 16)),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value){
                    setState((){
                      _gender=value;
                    });
  },
                  ),
                  ),
                 Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value){
                    setState((){
                      _gender=value;
                    });
},
),
            ),
            ],
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
              items: <String>['INDIA','Canada','Mexico']
              .map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                value:value,
                child:Text(value),
                );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      
                    });

                },
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please select your country';
                  }
                  return null;
              },),
            SizedBox(height: 16),
           CheckboxListTile(
            title: Text('I accept the terms and conditions'),
            value: _isTermsAccepted,
            onChanged: (bool? value){
              setState(() {
                _isTermsAccepted=value?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
           ),
           SizedBox(height: 16),
           ElevatedButton(
            onPressed: (){
       if(_formKey.currentState!.validate()){
        _formKey.currentState!.save();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text('Form Successfully submitted!')),
        );
       }
            },
            child: Text('Submit'),
           ),
          ],
        ),
      ),
    );
  }
}