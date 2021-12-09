import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/widgets/new_job_grid_entry..widget.dart';
import 'package:project/modules/job/widgets/new_job_image.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/shared/widgets/column_count_grid.widget.dart';

class JobForm extends StatefulWidget {
  const JobForm({Key? key}) : super(key: key);

  @override
  JobFormState createState() => JobFormState();
}

class JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  final List<Uint8List> images = [];

  JobModel? submit() {
    if (_formKey.currentState?.validate() ?? false)
      return JobModel(
          name: nameController.text, description: descriptionController.text);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            maxLines: 1,
            controller: nameController,
            validator: (value) => UtilValidators.guard(value)
                .required(S.of(context).CreateJobScreen_validator_name_required)
                .message,
            decoration: InputDecoration(
              label: Text(S.of(context).CreateJobScreen_form_name),
            ),
          ),
          SizedBox(height: ThemeConfig.of(context).mediumSpacing),
          TextFormField(
            controller: descriptionController,
            validator: (value) => UtilValidators.guard(value)
                .required(S
                    .of(context)
                    .CreateJobScreen_validator_description_required)
                .message,
            keyboardType: TextInputType.multiline,
            minLines: 8,
            maxLines: null,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              label: Text(S.of(context).CreateJobScreen_form_description),
            ),
          ),
          SizedBox(height: ThemeConfig.of(context).mediumSpacing),
          ColumnCountGrid(
            columnAlignment: WrapAlignment.start,
            count: ScreenLayout.isWide(context) ? 5 : 3,
            rowSpacing: ThemeConfig.of(context).smallSpacing,
            columnSpacing: ThemeConfig.of(context).smallSpacing,
            children: <Widget>[
              ...images.asMap().entries.map(
                    (entry) => NewJobImage(
                      image: MemoryImage(entry.value),
                      onRemoved: () => setState(
                        () {
                          images.removeAt(entry.key);
                        },
                      ),
                    ),
                  ),
              NewJobGridEntry(
                child: OutlinedButton(
                  onPressed: () async {
                    final image = await _imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      final bytes = await image.readAsBytes();
                      setState(
                        () => images.add(
                          bytes,
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.photo_camera),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
