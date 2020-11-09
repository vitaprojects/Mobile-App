import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:newpostman1/models/LocationModel.dart';
import 'package:newpostman1/useful/globals.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

class LocationSelectButton extends StatelessWidget {
  LocationSelectButton({
    this.labelText,
    this.removeLocation,
    this.attribute,
    this.locationModel,
    this.onLocationSelected,
  });
  final double blockHeight = Globals.blockHeight;
  final double blockWidth = Globals.blockWidth;
  final String labelText;
  final VoidCallback removeLocation;
  final String attribute;
  final LocationModel
      locationModel; //this model will contain data about the location

  final Function(LocationModel) onLocationSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        10,
      )),
      margin: EdgeInsets.all(
        0,
      ),
      child: Container(
        height: blockHeight * 10,
        // color: Colors.green,
        padding: EdgeInsets.only(
          left: blockWidth * 3,
          right: blockWidth * 3,
        ),
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (locationModel?.latitude == null &&
                locationModel?.longitude == null) {
              return Container(
                height: blockHeight * 6,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  onPressed: () async {
                    LocationResult result = await showLocationPicker(
                        context, "AIzaSyCYUS6bk7vS2far68Es9yagIm767LmyN-Y");
                    if (result != null &&
                        result.latLng.longitude != null &&
                        result.latLng.longitude != null) {
                      print(result.address);
                      LocationModel newLocationModel = LocationModel(
                        address: result.address,
                        latitude: result.latLng.latitude,
                        longitude: result.latLng.longitude,
                      );

                      onLocationSelected(newLocationModel);
                    }
                  },
                  padding: EdgeInsets.all(
                    0,
                  ),
                  child: Container(
                    height: blockHeight * 6,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Text(
                      labelText.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Globals.mainColor,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      // textAlign: TextAlign.center,
                      // initialValue:
                      //     (widget.initalText == null) ? '' : widget.initalText,
                      readOnly: true,
                      controller: TextEditingController(
                          text: locationModel.latitude.toStringAsFixed(3) +
                              "  , " +
                              locationModel.longitude.toStringAsFixed(3)),
                      attribute: attribute,
                      textAlignVertical: TextAlignVertical.center,

                      decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.green,
                          labelStyle: TextStyle(
                            color: Globals.mainColor,
                          ),
                          border: InputBorder.none,
                          labelText: labelText.toUpperCase(),
                          contentPadding: EdgeInsets.only(
                            left: blockWidth * 3,
                          )),
                    ),
                  ),
                  Container(
                    width: blockWidth * 8,
                    // color: Colors.redAccent,
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: blockWidth * 8,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          10,
                        )),
                        padding: EdgeInsets.all(
                          0,
                        ),
                        onPressed: () {
                          removeLocation();
                        },
                        child: Container(
                          height: blockWidth * 8,
                          // color: Colors.green,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.close,
                            size: blockWidth * 6,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
