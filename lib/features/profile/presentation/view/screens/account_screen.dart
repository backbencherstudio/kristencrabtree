import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kristencrabtree/app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/widgets/buttons/custom_textFormField.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Account'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            children: [
              Stack(
                children: [
                  ClipOval(
                    child: Image.asset('assets/images/user.png', scale: 2.4),
                  ),
                  Positioned(
                    top: 45.h,
                      right: -2.w,
                      child: SvgPicture.asset('assets/icons/edit_profile.svg'))
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFieldWidget(
                    labelText: 'First Name',
                    hintText: 'First Name',
                    width: 160.w,
                  ),
                  CustomTextFieldWidget(
                    labelText: 'Last name',
                    hintText: 'Last Name',
                    width: 160.w,
                  ),
                ],
              ),
              CustomTextFieldWidget(
                labelText: 'Email Address',
                hintText: '..@gmail.com',
                width: double.infinity,
              ),
              CustomTextFieldWidget(
                labelText: 'Password',
                hintText: 'Enter your password',
                width: double.infinity,
                isPasswordField: true,
              ),
              CustomTextFieldWidget(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
                width: double.infinity,
                isPasswordField: true,
              ),
        
              Row(spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor:Colors.white,
                        side: BorderSide(
                          color:  Color(0xffC6A664),
                          width: 1.5
                        )
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xff4A4C56),
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC6A664),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
