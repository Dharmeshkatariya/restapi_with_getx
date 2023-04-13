import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapi/controller/addpost_controller.dart';

import '../common.dart';

class AddPostScreen extends GetView<AddPostController> {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text("Add Data"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Common.textForm(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Mobile name  is required';
                            }
                          },
                          controller: controller.mobileNameController,
                          text: "mobile name",
                          preicon: const Icon(Icons.mobile_screen_share_sharp),
                        ),
                        Common.textForm(
                          controller: controller.colorController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' color  is required';
                            }
                          },
                          text: "color ",
                          preicon: const Icon(Icons.color_lens_outlined),
                        ),
                        Common.textForm(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' capacity  is required';
                            }
                          },
                          controller: controller.capacityController,
                          text: "capacity ",
                          preicon: const Icon(Icons.type_specimen),
                        ),
                        Common.textForm(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' price  is required';
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.priceController,
                          text: "price ",
                          preicon: const Icon(Icons.money),
                        ),
                        Common.button(
                            text: "Add Data ",
                            color: Colors.red,
                            textcolor: Colors.white,
                            onTap: () {
                              if (_form.currentState!.validate()) {
                                controller.isEdit.isTrue
                                    ? controller.updateDataApi()
                                    : controller.addDataApi();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
