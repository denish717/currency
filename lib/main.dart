import 'dart:convert';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(home: api(),
    debugShowCheckedModeBanner: false,
  ));
}
class api extends StatefulWidget {


  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  String rs="";
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APIDEMO"),),
      body: Column(children: [
        TextField(readOnly: true,onTap: () {
          showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
              print('Select currency: ${currency.name}');
              t1.text=currency.code;
              setState(() {

              });
            },
          );
        },controller: t1,decoration: InputDecoration(hintText: "from"),),
        TextField(readOnly: true,onTap: () {
          showCurrencyPicker(
            context: context,
            showFlag: true,
            showCurrencyName: true,
            showCurrencyCode: true,
            onSelect: (Currency currency) {
              print('Select currency: ${currency.code}');
              t2.text=currency.code;
              setState(() {

              });
            },
          );
        },controller: t2,decoration: InputDecoration(hintText: "to"),),
        TextField(controller: t3,decoration: InputDecoration(hintText: "amt"),),
        ElevatedButton(onPressed: () async {
          String from,to,amount;
          from=t1.text;
          to=t2.text;
          amount=t3.text;
          var url = Uri.parse('https://dfgggw.000webhostapp.com/money1.php');
          var response = await http.post(url, body: {'from': '$from', 'to': '$to', 'amount': '$amount'});
          Map m=jsonDecode(response.body);
          print(m);
          rs=m['result'].toString();
          setState(() {

          });

          }, child: Text("submit")),
        Text("AMOUNT=$rs"),
      ],),
    );
  }
}

