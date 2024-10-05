import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medibound_library/src/data-ui/Selected.dart';

class MbListTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const MbListTile({
    required this.isSelected,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MbSelected(
      active: isSelected,
      child: Container(
        height: 40, // Set the height of the ListTile
        child: FilledButton(

          
          child: 
              Container(
                color: Colors.red,
                child: Row(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon, size: 18),
                    SizedBox(width: 7),
                    Text(
                      style: TextStyle(height: 1),
                      title,
                    ),
                  ],
                ),
              ),
            
          onPressed: onTap,
        ),
      ),
    );
  }
}
