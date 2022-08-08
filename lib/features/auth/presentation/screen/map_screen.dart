import 'dart:async';

import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:location/location.dart' as location;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _controller = Completer<GoogleMapController>();
  final MapPickerController mapPickerController = MapPickerController();
  final locationTEC = TextEditingController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(22.991206, 31.150197),
    zoom: 12.4746,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final currentLocation = await location.Location().getLocation();
      await _controller.future.then(
        (value) => value.moveCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 18.4746,
          ),
        )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            iconWidget: Image.asset(Assets.icons.locationIcon.path, height: 30.h),
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
              padding: EdgeInsets.symmetric(vertical: 70.h),
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
              onCameraMoveStarted: () {
                mapPickerController.mapMoving!();
                locationTEC.text = "Loading location...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                mapPickerController.mapFinishedMoving!();
                List<Placemark> placeMarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );
                locationTEC.text = '${placeMarks.first.name}, ${placeMarks.first.administrativeArea}, ${placeMarks.first.country}';
              },
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            top: MediaQuery.of(context).viewPadding.top + 10.h,
            start: 0,
            child: MaterialButton(
              onPressed: Get.back,
              color: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryColor),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextFormField(controller: locationTEC, maxLines: 2),
                ),
                18.heightBox,
                AppButton(
                  onPressed: () {
                    Get.find<PersonalInfoController>().addressController.text = locationTEC.text;
                    Get.back();
                  },
                  minimumSize: Size(double.infinity, 40.h),
                  title: LocalizationKeys.selectLocation.tr,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
