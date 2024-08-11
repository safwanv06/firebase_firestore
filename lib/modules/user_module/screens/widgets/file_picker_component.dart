import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/controller.dart';
import '../../services/model.dart';
import '../../services/service.dart';

class FilePickerComponent extends ConsumerWidget {
  FilePickerComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationDetails = ref.watch(locationDetailsProvider).data;
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: locationDetails != null ? Colors.green : null,
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
      child: InkWell(
        onTap: () async {
          FilePickerResult? file = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['xlsx']);
          if (file != null) {
            File pickedFile = File(file.files.first.path!);
            List<LocationData> locations =
                await ExcelService().parseExcelFile(pickedFile);
            ref
                .read(locationDetailsProvider)
                .updateLocationData(data: locations);
          }
        },
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                locationDetails != null
                    ? "File Picked"
                    : "Pick your excel sheet",
                style: TextStyle(
                    color: locationDetails != null
                        ? Colors.white
                        : Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp),
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.file_copy_outlined,
                size: 16.sp,
                color: locationDetails != null
                    ? Colors.white
                    : Colors.grey.shade600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
