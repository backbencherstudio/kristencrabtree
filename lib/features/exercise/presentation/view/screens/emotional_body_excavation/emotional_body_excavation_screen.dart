import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/custom_layers/layer_four.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/custom_layers/layer_one.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/custom_layers/layer_three.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/custom_layers/layer_two.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/custom_stepper.dart';
import 'package:kristencrabtree/features/exercise/presentation/view/widgets/welldone_card.dart';
import 'package:kristencrabtree/features/exercise/presentation/view_model/emotional_body_excavation_screen_provider.dart';
import 'package:provider/provider.dart';


class EmotionalBodyExcavationScreen extends StatelessWidget {
  const EmotionalBodyExcavationScreen({super.key});

  Widget _getLayer(int currentLayer) {
    switch (currentLayer) {
      case 0:
        return LayerOne();
      case 1:
        return LayerTwo();
      case 2:
        return LayerThree();
      case 3:
        return LayerFour();
      default:
        return LayerOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmotionalBodyExcavationScreenProvider>();
    return Scaffold(
      appBar: CustomAppBar(title: 'Emotional Body Excavation'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(provider.completedDig == 1)
                  WellDoneCard(title: 'Dig 1 Completed! Well Done!!', isDone: true),
                SizedBox(height: 16.h,),
                _getLayer(provider.completedSteps),
                SizedBox(height: 16.h,),
                if(provider.completedDig == 0)
                  WellDoneCard(title: 'Dig 2: Pattern Awareness', isDone: false),
                SizedBox(height: 16.h,),
                Text(
                  'Emotional Body Excavation',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomStepper(
                    totalSteps: 2,
                    completedSteps: provider.completedDig,
                    totalPoint: 160,
                    isLayerCount: false,
                  ),
                ),
                SizedBox(height: 24.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
