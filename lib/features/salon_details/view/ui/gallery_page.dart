import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/features/salon_details/model/gallery_add_request.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/gallery_cubit.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/gallery_state.dart';
import 'package:vylee_partner/navigation/page_routes.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key, this.isEdit});
  final bool? isEdit;

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final picker = ImagePicker();

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
                BlocBuilder<GalleryCubit, GalleryState>(
                  builder: (context, state) {
                    final imagePaths = state is GalleryItemsPickedState
                        ? state.imagePaths
                        : [];
                    final videoPaths = state is GalleryItemsPickedState
                        ? state.videoPaths
                        : [];
                    return Column(
                      children: [
                        ...List.generate(imagePaths.length, (index) {
                          return Container(
                            width: SizeConfig.screenWidth! * 0.82,
                            height: 40,
                            decoration: BoxDecoration(
                                // color: AppColors.gray600,
                                border: Border.all(
                                    color: AppColors.appViolet, width: 1)),
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(imagePaths[index]
                                      .split(Platform.pathSeparator)
                                      .last),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<GalleryCubit>()
                                          .removeGalleryItem(
                                              GalleryItemType.images,
                                              imagePaths[index]);
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          );
                        }),
                        ...List.generate(videoPaths.length, (index) {
                          return Container(
                            width: SizeConfig.screenWidth! * 0.82,
                            height: 40,
                            decoration: BoxDecoration(
                                // color: AppColors.gray600,
                                border: Border.all(
                                    color: AppColors.appViolet, width: 1)),
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(videoPaths[index]
                                      .split(Platform.pathSeparator)
                                      .last),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<GalleryCubit>()
                                          .removeGalleryItem(
                                              GalleryItemType.videos,
                                              videoPaths[index]);
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          );
                        }),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    final xfile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (xfile != null) {
                      final selectedImage = File(xfile.path);
                      context.read<GalleryCubit>().pickGalleryItem(
                          GalleryItemType.images, selectedImage);
                    }
                  },
                  child: DottedBorder(
                    borderType: BorderType.Rect,
                    child: SizedBox(
                        height: SizeConfig.screenHeight! * 0.22,
                        width: SizeConfig.screenWidth! * 0.8,
                        child: const Column(
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
                        )),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight! * 0.07),
                GestureDetector(
                  onTap: () async {
                    final xfile =
                        await picker.pickVideo(source: ImageSource.gallery);
                    if (xfile != null) {
                      final selectedVideo = File(xfile.path);
                      context.read<GalleryCubit>().pickGalleryItem(
                          GalleryItemType.videos, selectedVideo);
                      // final thumbnail = await VideoThumbnail.thumbnailFile(
                      //     video: xfile.path,
                      //     imageFormat: ImageFormat.JPEG,
                      //     quality: 75);
                      //   if (thumbnail != null) {
                      //     final file = File(thumbnail);
                      //     selectedVideoThumbnail = file;
                      //   }
                    }
                  },
                  child: DottedBorder(
                    borderType: BorderType.Rect,
                    child: SizedBox(
                        height: SizeConfig.screenHeight! * 0.22,
                        width: SizeConfig.screenWidth! * 0.8,
                        child: const Column(
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
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.07,
            ),
            Center(
              child: BlocConsumer<GalleryCubit, GalleryState>(
                listener: (context, state) {
                  if (state is GalleryFailureState) {
                    showToast((state).error);
                  } else if (state is GallerySuccessState) {
                    showToast("Gallery Saved");
                    if (widget.isEdit != true) {
                      Navigator.of(context).pushNamed(PageRoutes.successScreen);
                    } else {
                      Navigator.of(context).pushNamed(PageRoutes.successScreen);
                    }
                  }
                },
                listenWhen: (previous, current) {
                  return current is! GalleryItemsPickedState;
                },
                buildWhen: (previous, current) {
                  return current is! GalleryItemsPickedState;
                },
                builder: (context, state) {
                  if (state is GalleryLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  return SizedBox(
                    height: SizeConfig.screenHeight! * 0.055,
                    width: SizeConfig.screenWidth! * 0.42,
                    child: CustomButton(
                      text: widget.isEdit == true ? "SAVE" : "CONTINUE",
                      borderColor: AppColors.appBorderPurple,
                      textStyle: GoogleFonts.lateef(
                          fontWeight: FontWeight.w400, fontSize: 26),
                      onPressed: () async {
                        await context.read<GalleryCubit>().uploadFiles();
                      },
                    ),
                  );
                },
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
