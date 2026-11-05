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
      home: CurrencyConversion(),
    );
  }
}

class CurrencyConversion extends StatefulWidget{
  const CurrencyConversion({super.key});

  @override
  State<CurrencyConversion> createState() => _CurrencyConversionState();
  }

  class _CurrencyConversionState extends State<CurrencyConversion>{
    ValueChanged<double>? get onChanged => null;
    String _userinput = "";//variable used to have userinput the number they want to convert
    double finalnumber = 0; //the final number for conversion
   var _fromcurrencies = ['GBP','EUR','USD','JPY','AUD']; //the list of currencies that could convert from for
      var _currencies = ['GBP','EUR','USD','JPY','AUD'];//the list of currencies that a user can input

    String _fromcurrrencyvalue = 'GBP'; //generic value for the first dropdown display
    String _currencyvalue = 'GBP'; //generic value for the second dropdown display
    var _conversions = {'GBP':1,'EUR':1.20 ,'USD':1.35, 'JPY':213.31,'AUD': 1.92}; //matrix fo conversion
    
    void currencyconverter(){
     finalnumber= int.parse(_userinput) / _conversions[_fromcurrencies]!; //converting the from currecny to gdp for easier calculation

      
    }


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
                //creating the display to show the final conversion
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
                    //creating the field where the user inputs the number they want converted
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
                onChanged: (newValue){
                  setState(() {
                    _currencyvalue = newValue!;
                  });
                  //creating the drop down menu for users to select the currency the want to convert
                },
                ),
                 IconButton(onPressed:(){ 
                  setState(() {
                    String tempvalue = _fromcurrrencyvalue;
                    _fromcurrrencyvalue =_currencyvalue;
                    _currencyvalue = tempvalue;
                  });
                }, icon:const Icon(Icons.swap_horizontal_circle_sharp)),
                //creating a button for the user to swap the to and from currencies
                  
                Text("From", style: theme.textTheme.titleMedium),
                DropdownButton(
                  value: _fromcurrrencyvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _fromcurrencies.map((String value){
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                onChanged: (newValue){
                  setState(() {
                    _fromcurrrencyvalue = newValue!;
                  });
                  //creating the drop down menu for currencies from which the user can convert from
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
