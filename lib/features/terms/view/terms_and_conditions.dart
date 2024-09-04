import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/common widgets/custom_appbar.dart';
import '../../../core/load_image/image_loader.dart';
import '../../../core/path/image_path.dart';
import '../../../themes/app_colors.dart';
import '../../../utilities/string.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingWidget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ImageLoader.asset(
            ImagePath.vyleeTextLogo,
            height: 10,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        height: 100,
        backgroundColor: AppColors.appViolet,
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 25,
                      weight: 100,
                      color: AppColors.appViolet,
                    )),
                Text(
                  Constant.termsAndConditions,
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1.  Services Provided by VYLEE Salon:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("2. Salon Criteria: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("3. Payment Terms: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms3,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("4. Customer Management: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms4,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("5. Dispute Resolution: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms5,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("6. Marketing and Promotion: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms6,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("7. Termination: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms7,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("8. Liability:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms8,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("9. Confidentiality: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms9,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("10. Quality Maintenance: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms10,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                  Text("11. Pricing: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(Constant.terms11,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
