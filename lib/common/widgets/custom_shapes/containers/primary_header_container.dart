import 'package:anytime_todo_app/common/constants/app_colors.dart';
import 'package:anytime_todo_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:anytime_todo_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.containerColor = AppColors.primary,
  });

  final Widget child;
  final Color? containerColor;

  @override
  Widget build(BuildContext context) {
    //final height = context.screenHeight;
    return TCurvedEdgeWidget(
      child: Container(
        //height: height * 0.28, //KALDIRILACAK MI?
        color: containerColor,
        padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                  backgroundColor: AppColors.textWhite.withOpacity(0.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
