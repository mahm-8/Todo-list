import 'package:flutter/material.dart';

validtion({required GlobalKey<FormState> formKey}){
    if(formKey.currentState!.validate()){
      return true;
    }
    return false;
  }