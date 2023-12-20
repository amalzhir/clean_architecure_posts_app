import 'package:clean_architecure_posts_app/core/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(height: 30,
        width: 30,
          child: CircularProgressIndicator(
            color: secondaryColor,),
        ),
      ),
    );
  }
}
