import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final picker = ImagePicker();
  File? selectedImage;
  File? selectedVideo;
  File? selectedVideoThumbnail;
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
              height: 10,
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
                const Icon(
                  Icons.image_outlined,
                  color: AppColors.gray600,
                ),
                const SizedBox(width: 8),
                const Text(
                  "GALLERY",
                  style: TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final xfile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (xfile != null) {
                      setState(() {
                        selectedImage = File(xfile.path);
                      });
                    }
                  },
                  child: DottedBorder(
                    borderType: BorderType.Rect,
                    child: SizedBox(
                        height: SizeConfig.screenHeight! * 0.22,
                        width: SizeConfig.screenWidth! * 0.8,
                        child: selectedImage == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: AppColors.appViolet,
                                    size: 40,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Tap To Add Image",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.appViolet),
                                  )
                                ],
                              )
                            : Image.file(
                                selectedImage!,
                                fit: BoxFit.fill,
                              )),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.07),
                GestureDetector(
                  onTap: () async {
                    final xfile =
                        await picker.pickVideo(source: ImageSource.gallery);
                    if (xfile != null) {
                      selectedVideo = File(xfile.path);
                      final thumbnail = await VideoThumbnail.thumbnailFile(
                          video: xfile.path,
                          imageFormat: ImageFormat.JPEG,
                          quality: 75);
                      setState(() {
                        if (thumbnail != null) {
                          final file = File(thumbnail);
                          selectedVideoThumbnail = file;
                        }
                      });
                    }
                  },
                  child: DottedBorder(
                    borderType: BorderType.Rect,
                    child: SizedBox(
                        height: SizeConfig.screenHeight! * 0.22,
                        width: SizeConfig.screenWidth! * 0.8,
                        child: selectedVideoThumbnail == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_outline_sharp,
                                    color: AppColors.appViolet,
                                    size: 40,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Tap To Add Video",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.appViolet),
                                  )
                                ],
                              )
                            : Align(
                                alignment: Alignment.center,
                                child: Stack(
                                  children: [
                                    Image.file(
                                      selectedVideoThumbnail!,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                        top: SizeConfig.screenHeight! * 0.1,
                                        left: 50,
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: AppColors.white,
                                        ))
                                  ],
                                ),
                              )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.07,
            ),
            Center(
              child: SizedBox(
                height: SizeConfig.screenHeight! * 0.055,
                width: SizeConfig.screenWidth! * 0.42,
                child: CustomButton(
                  text: "CONTINUE",
                  borderColor: AppColors.appBorderPurple,
                  textStyle: GoogleFonts.lateef(
                      fontWeight: FontWeight.w400, fontSize: 26),
                  onPressed: () {
                    if (mounted) {
                      Navigator.of(context)
                          .pushNamed(PageRoutes.serviceCategories);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
