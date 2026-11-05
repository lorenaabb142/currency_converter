import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
      
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 93, 188, 139)),
      ),
      home: currencyconversion(),
    );
  }
}

class currencyconversion extends StatefulWidget{
  const currencyconversion({super.key});

  @override
  State<currencyconversion> createState() => _currencyconversionState();
  }

  class _currencyconversionState extends State<currencyconversion>{
    ValueChanged<double>? get onChanged => null;
    String _userinput = "";
    var _currencies = ['GDP','EUR','USD','JPY','AUD'];
    String _currencyvalue = 'GDP';


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.normal
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency converter"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(10), 
            ),
            child: Column(
              children: [
                Text("Converted:", style: theme.textTheme.titleMedium),
                Text("100", style: style.copyWith(color: theme.colorScheme.onPrimary, fontSize: theme.textTheme.bodyMedium?.fontSize),),
              ],
            ) 
          ),
          Padding(padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:  theme.colorScheme.onPrimary,
                width: 2
              )
            ),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter amount wanted to be converted",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _userinput = value;
                    });
                  } ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text("To:", style: theme.textTheme.titleMedium),
                DropdownButton(
                  value: _currencyvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _currencies.map((String value){
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                onChanged: (String? newValue){
                  setState(() {
                    _currencyvalue = newValue!;
                  });
                },
                ),
                  ]
            ),
              ]
            ),
          ),)
        ],
      ),
    );
          

  }
}
