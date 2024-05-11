import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({required this.hintText,required this.typeField,required this.controller});
String? hintText;
String? typeField;
// Function(String)? onChange;
   TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      textInputAction: TextInputAction.next,
           // onChanged:onChange ,
        controller:controller ,
        decoration:  InputDecoration(
        filled: true,

          border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30),
          ),
            borderSide: BorderSide.none
          ),
          hintText: '$hintText'),
      validator: (value) {
        if(typeField=='email') {
          if (value == null) {
            return " required";
          }
          return (value.length<1)
              ? 'required '
              : null;
        }
        if(typeField=='password')
        {
          if(value==null){
            return 'required';
          }
          return (value.length < 2) ? 'Too Short' : null;


        } if(typeField=='name')
        {
          validator: (value) {
            if (value==null) {
              return "required";
            }

            return (value.length < 1) ? 'required' : null;
          };
        }
      }


    );
  }
}
