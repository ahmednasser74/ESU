import 'dart:async';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(41.311158, 69.279737),
    zoom: 14.4746,
  );

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MapPicker(
            iconWidget: Image.asset(
              Assets.icons.locationIcon.path,
              height: 30.h,
            ),
            mapPickerController: mapPickerController,
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onCameraMoveStarted: () {
                mapPickerController.mapMoving!();
                textController.text = "checking ...";
              },
              onCameraMove: (cameraPosition) {
                this.cameraPosition = cameraPosition;
              },
              onCameraIdle: () async {
                mapPickerController.mapFinishedMoving!();
                //get address name from camera position
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );

                // update the ui with the address
                textController.text = '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewPadding.top + 20,
            width: MediaQuery.of(context).size.width - 50,
            height: 50,
            child: TextFormField(
              maxLines: 3,
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: const InputDecoration(contentPadding: EdgeInsets.zero, border: InputBorder.none),
              controller: textController,
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 50,
              child: AppButton(
                onPressed: () {
                  Get.find<PersonalInfoController>().addressController.text = 'okey okey okey okey ';
                  print("Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                  print("Address: ${textController.text}");
                  Get.back();
                },
                title: LocalizationKeys.selectLocation.tr,
              ),
            ),
          )
        ],
      ),
    );
  }
}
