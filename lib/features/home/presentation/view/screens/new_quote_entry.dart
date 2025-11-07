import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/widgets/appbar/simple_appbar.dart';

class NewQuoteEntry extends StatefulWidget {
  const NewQuoteEntry({super.key});

  @override
  State<NewQuoteEntry> createState() => _NewQuoteEntryState();
}

class _NewQuoteEntryState extends State<NewQuoteEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFEFA),
      appBar: CustomAppBar(title: 'Create Quote Entry'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                'Quote Author',
                style: TextStyle(
                  color: Color(0xff4A4C56),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Kristen Crabtree',
                  hintStyle: const TextStyle(
                    color: Color(0xff4A4C56),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xffC6A664),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xffC6A664),
                      width: 2,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                cursorColor: Color(0xffC6A664),
              ),

              Text(
                'Quote Description',
                style: TextStyle(
                  color: Color(0xff4A4C56),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              TextFormField(maxLines: 6,
                decoration: InputDecoration(
                  hintText: '"The cave you fear to enter holds the treasure you seek. Your authentic self awaits beyond the layers of conditioning."',
                  hintStyle: const TextStyle(
                    color: Color(0xff4A4C56),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC6A664), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC6A664), width: 2),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                cursorColor: Color(0xffC6A664),
              ),
              Text(
                'Quote Reason',
                style: TextStyle(
                  color: Color(0xff4A4C56),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Be The You That's More You",
                  hintStyle: const TextStyle(
                    color: Color(0xff4A4C56),
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC6A664), width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffC6A664), width: 2),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                cursorColor: Color(0xffC6A664),
              ),
              SizedBox(height: 10.h,),
              
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xffC6A664),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: (){}, child: Center(child: Text('Save',style: TextStyle(color: Colors.white),),))
            ],
          ),
        ),
      ),
    );
  }
}
