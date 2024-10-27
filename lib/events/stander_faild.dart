import 'package:flutter/material.dart';

class StanderFaild extends StatelessWidget 
{
  TextEditingController?  controler =TextEditingController();
  String ?label;
  int ?maxLines;
  StanderFaild
  (
    
    {super.key, required this.controler,required this.label,this.maxLines=1,}
    
  );

  @override
  Widget build(BuildContext context)
  {
    return TextField
              (
                controller: controler,
                decoration: InputDecoration
                (
                  //icon: Icon(Icons.title),
                  labelText: label,
                  border: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue)
                  )
                ),
                maxLines: maxLines,
              );
  }
}