import 'package:flutter/material.dart';
import 'package:currency_picker/currency_picker.dart';



// ignore: use_function_type_syntax_for_parameters
Widget customDropDown(List<String> items, String value,void onChange(val))
{
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 18.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 1.4),
      borderRadius: BorderRadius.circular(8.0),
    ),

    child: DropdownButton<String>(

      value: value.isNotEmpty ? value : null,
      onChanged: (String? value){

        onChange(value);
      },

      items: items.map((String valuu){

        return DropdownMenuItem<String>(

          value: valuu,

          child: Text(valuu),

        );

      }).toList(),
    ),
  );
}