import 'package:flutter/material.dart';

class CustemBtn extends StatelessWidget {
  const CustemBtn({super.key, this.onTap,  this.isLoading=false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 34, 57, 237)),
        child:  Center(
            child: isLoading ? 
            const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                 color: Colors.white,
              ),
            ) : const Text(
          "Add",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
