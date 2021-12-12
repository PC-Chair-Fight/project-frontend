import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/shared/widgets/card_grid_entry.widget.dart';
import 'package:project/modules/job/widgets/new_job_image.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:project/modules/shared/utils/validators.utils.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/shared/widgets/column_count_grid.widget.dart';

import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';

class JobForm extends StatefulWidget {
  JobForm({Key? key}) : super(key: key);

  @override
  JobFormState createState() => JobFormState();
}

class JobFormState extends State<JobForm> {
  final _formKey = GlobalKey<FormState>();
  final _imagePicker = ImagePicker();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<Uint8List> _images = [];

  bool _processingImage = false;

  // on web, when cancelling the file dialog, the image picker future never finishes.
  // this is to avoid disabling the add picture button if we're on web
  bool get _shouldDisableAddPictureButton => !kIsWeb && _processingImage;

  JobFormResult? submit() {
    if (_formKey.currentState?.validate() ?? false) {
      return JobFormResult(
        JobModel(
          name: _nameController.text,
          description: _descriptionController.text,
        ),
        _images,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
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
            controller: _nameController,
            validator: (value) => UtilValidators.guard(value)
                .required(S.of(context).CreateJobScreen_validator_name_required)
                .message,
            decoration: InputDecoration(
              label: Text(S.of(context).CreateJobScreen_form_name),
            ),
          ),
          SizedBox(height: ThemeConfig.of(context).mediumSpacing),
          TextFormField(
            controller: _descriptionController,
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
              ..._images.asMap().entries.map(
                    (entry) => NewJobImage(
                      image: MemoryImage(entry.value),
                      onRemoved: () => setState(
                        () {
                          _images.removeAt(entry.key);
                        },
                      ),
                    ),
                  ),
              CardGridEntry(
                aspectRatio: 1.78,
                child: OutlinedButton(
                  onPressed: _shouldDisableAddPictureButton
                      ? null
                      : () async {
                          late final Future<XFile?> imageFuture;
                          if (kIsWeb)
                            imageFuture = _imagePicker.pickImage(
                              source: ImageSource.gallery,
                            );
                          else
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: EdgeInsets.all(
                                    ThemeConfig.of(context).appMargin),
                                child: ColumnCountGrid(
                                  count: 2,
                                  rowSpacing:
                                      ThemeConfig.of(context).mediumSpacing,
                                  columnSpacing:
                                      ThemeConfig.of(context).mediumSpacing,
                                  children: [
                                    {
                                      'src': ImageSource.gallery,
                                      'icon': Icons.upload_file_sharp,
                                      'txt': 'Existing Image'
                                    },
                                    {
                                      'src': ImageSource.camera,
                                      'icon': Icons.photo_camera,
                                      'txt': 'Take Photo'
                                    }
                                  ]
                                      .map(
                                        (e) => CardGridEntry(
                                          aspectRatio: 1.78,
                                          child: OutlinedButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              imageFuture =
                                                  _imagePicker.pickImage(
                                                source: e['src'] as ImageSource,
                                              );
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(e['icon'] as IconData),
                                                Text(e['txt'] as String)
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            );

                          setState(() => _processingImage = true);
                          unawaited(
                            imageFuture.then((image) async {
                              final bytes = await image?.readAsBytes();
                              if (bytes != null)
                                setState(() => _images.add(bytes));
                            }).whenComplete(
                              () => setState(() => _processingImage = false),
                            ),
                          );
                        },
                  child: _shouldDisableAddPictureButton
                      ? LoadingIndicator(
                          type: LoadingIndicatorType.OutlinedButton,
                        )
                      : Icon(Icons.photo_camera),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobFormResult {
  final JobModel jobModel;
  final List<Uint8List> images;

  JobFormResult(this.jobModel, this.images);
}
