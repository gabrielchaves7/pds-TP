import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:premium_todo/design_system/design_system.dart';
import 'package:premium_todo/design_system/organisms/ds_image_picker.dart';
import 'package:premium_todo/modules/app/app.dart';
import 'package:premium_todo/modules/home/bloc/create_job_cubit.dart';
import 'package:premium_todo/modules/home/bloc/create_job_state.dart';
import 'package:premium_todo/modules/home/bloc/home_cubit.dart';

class DsCreateJob extends StatefulWidget {
  const DsCreateJob({super.key});

  @override
  State<DsCreateJob> createState() => _DsCreateJobState();
}

class _DsCreateJobState extends State<DsCreateJob> {
  FilePickerResult? filePickerResult;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateJobCubit, CreateJobState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.inProgress) {
          context.loaderOverlay.show();
        } else if (state.status == FormzSubmissionStatus.success) {
          context.loaderOverlay.hide();
          Navigator.of(context).pop();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(DsSpacing.xxxxs),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 548,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: LoaderOverlay(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 44,
                        color: Colors.black,
                      ),
                      text: 'Crie sua ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'vaga',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w600,
                            fontSize: 44,
                            color: DsColors.brandColorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _NameInput(),
                  _LocationInput(),
                  _MinSalaryInput(),
                  _MaxSalaryInput(),
                  _PhoneInput(),
                  _EmailInput(),
                  _DescriptionInput(),
                  const SizedBox(
                    height: 32,
                  ),
                  DsImagePicker(
                    filePickerResult: filePickerResult,
                    onDeleteSelectedFile: () {
                      setState(() {
                        filePickerResult = null;
                      });
                    },
                    onFilePick: (FilePickerResult? file) {
                      setState(() {
                        filePickerResult = file;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocBuilder<CreateJobCubit, CreateJobState>(
                    builder: (context, state) {
                      final createJobCubit = context.read<CreateJobCubit>();
                      final homeCubit = context.read<HomeCubit>();
                      final appBloc = context.read<AppBloc>();
                      return DsOutlinedButton(
                        onPressed: (state.isValid &&
                                filePickerResult?.files.first != null)
                            ? () {
                                createJobCubit.createJob(
                                  rawPath: filePickerResult!.files.first.bytes!,
                                  onJobCreated: homeCubit.updateJobsList,
                                  companyId: appBloc.state.user.id,
                                );
                              }
                            : null,
                        child: const Text('Criar'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.name != current.jobForm.name,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_nameInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                name: DefaultJobInput.dirty(value),
              ),
          label: 'Nome',
          errorText:
              state.jobForm.name.displayError != null ? 'invalid name' : null,
        );
      },
    );
  }
}

class _LocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.location != current.jobForm.location,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_locationInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                location: DefaultJobInput.dirty(value),
              ),
          label: 'Localização',
          errorText: state.jobForm.location.displayError != null
              ? 'invalid location'
              : null,
        );
      },
    );
  }
}

class _MinSalaryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.minSalary != current.jobForm.minSalary,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_minSalaryInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                minSalary: JobMinSalary.dirty(double.tryParse(value) ?? 0),
              ),
          textInputType: TextInputType.number,
          label: 'Salário mínimo',
          errorText: state.jobForm.minSalary.displayError != null
              ? 'invalid salary'
              : null,
        );
      },
    );
  }
}

class _MaxSalaryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.maxSalary != current.jobForm.maxSalary,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_maxSalaryInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                maxSalary: JobMaxSalary.dirty(double.tryParse(value) ?? 0),
              ),
          textInputType: TextInputType.number,
          label: 'Salário máximo',
          errorText: state.jobForm.maxSalary.displayError != null
              ? 'invalid salary'
              : null,
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.phone != current.jobForm.phone,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_phoneInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                phone: DefaultJobInput.dirty(value),
              ),
          label: 'Telefone',
          errorText:
              state.jobForm.phone.displayError != null ? 'invalid phone' : null,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.email != current.jobForm.email,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_emailInput_textField'),
          onChanged: (email) => context.read<CreateJobCubit>().updateForm(
                email: Email.dirty(email),
              ),
          textInputType: TextInputType.emailAddress,
          label: 'Email',
          errorText:
              state.jobForm.email.displayError != null ? 'invalid email' : null,
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobCubit, CreateJobState>(
      buildWhen: (previous, current) =>
          previous.jobForm.description != current.jobForm.description,
      builder: (context, state) {
        return DSTextField(
          key: const Key('createJobForm_descriptionInput_textField'),
          onChanged: (value) => context.read<CreateJobCubit>().updateForm(
                description: DefaultJobInput.dirty(value),
              ),
          label: 'Descrição',
          errorText: state.jobForm.description.displayError != null
              ? 'invalid description'
              : null,
        );
      },
    );
  }
}
