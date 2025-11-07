import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../app/widgets/appbar/simple_appbar.dart';

class MyQuotes extends StatefulWidget {
  const MyQuotes({super.key});

  @override
  State<MyQuotes> createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Quotes'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffC6A664)),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/cottation_swap.svg',
                              ),
                              Spacer(),
                              SvgPicture.asset('assets/icons/edit.svg'),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            '"The cave you fear to enter holds the treasure you seek. Your authentic self awaits beyond the layers of conditioning."',
                            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff4A4C56)),
                          ),
                          SizedBox(height: 18.h),
                          Row(
                            children: [
                              Text(
                                '- Kristen Crabtree',
                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Color(0xffC6A664)),
                              ),
                              Spacer(),
                              Text(
                                "Be The You That's More You",
                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Color(0xff777980)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
