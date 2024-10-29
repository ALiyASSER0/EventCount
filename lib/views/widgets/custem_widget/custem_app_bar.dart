import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,  this.image, this.icon, this.onPressed});
  final String title;
  final void Function()? onPressed;
  final ImageProvider<Object>? image;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Opens the drawer
          },
        ),
        Text(
          title,
          style:  const TextStyle(fontSize: 28),
        ),
        if (image != null) 
           Image(image: image!, width: 50, height: 50)
       else if (icon != null) 
          IconButton(icon: Icon(icon), onPressed: onPressed,)
    
      ],
    );
  }
}
