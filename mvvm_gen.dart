import 'dart:developer';
import 'dart:io';

final String _capitalName =
    'Authentication'; // like Home, Profile, OrderHistory, etc.

final String _lowerName =
    'authentication'; // like home, profile, orderHistory, etc.
final String _lowerNamePath =
    'authentication'; // like home, profile, order_history, etc. (used for file paths)
final String _appName = 'healthAndBeauty';

void main() async {
  // final data = jsonDecode(await File('setup.json').readAsString());
  // List of directories to create
  final directories = [
    // 'lib/core/shared',
    // 'lib/config/shared',
    // 'lib/core/constants',
    // 'lib/core/theme',
    // 'lib/core/helpers/extensions',
    'lib/features/$_lowerNamePath/logic',
    'lib/features/$_lowerNamePath/data',
    'lib/features/$_lowerNamePath/data/model',
    'lib/features/$_lowerNamePath/data/repo',
    'lib/features/$_lowerNamePath/data/api',
    'lib/features/$_lowerNamePath/views',
    'lib/features/$_lowerNamePath/views/widgets',
    // 'lib/features/home/ui/widgets',
  ];

  // Map of files with their content
  final files = {
    //!MARK: cubit file
    'lib/features/$_lowerNamePath/logic/${_lowerNamePath}_cubit.dart':
        '''
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:$_appName/core/networking/enums/request_state.dart';
import 'package:$_appName/features/$_lowerNamePath/data/repo/${_lowerNamePath}_repo.dart';

part '${_lowerNamePath}_state.dart';

class ${_capitalName}Cubit extends Cubit<${_capitalName}State> {
  final ${_capitalName}Repo _${_lowerName}Repo;
  ${_capitalName}Cubit(this._${_lowerName}Repo) : super(${_capitalName}State());

  Future<void> get${_capitalName}Data() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _${_lowerName}Repo.get${_capitalName}Data();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}

// TODO: add these 4 lines to dependency injection file and these imports
  ///!MARK: FOR $_capitalName  ///
  getIt.registerFactory<${_capitalName}Cubit>(
      () => ${_capitalName}Cubit(getIt<${_capitalName}Repo>()));
  getIt.registerLazySingleton<${_capitalName}Repo>(() => ${_capitalName}ApiServices());
''',

    //!MARK: state file
    'lib/features/$_lowerNamePath/logic/${_lowerNamePath}_state.dart':
        '''
part of '${_lowerNamePath}_cubit.dart';

class ${_capitalName}State {
  final RequestState state;

  ${_capitalName}State({this.state = RequestState.initial});

  ${_capitalName}State copyWith({
    RequestState? state,
  }) {
    return ${_capitalName}State(
      state: state ?? this.state,
    );
  }
}
''',
    //!MARK: repo file
    'lib/features/$_lowerNamePath/data/repo/${_lowerNamePath}_repo.dart':
        '''
import 'package:$_appName/core/networking/models/success_model.dart';
import 'package:$_appName/core/networking/network/result.dart';

abstract class ${_capitalName}Repo {
  //! ----------------------------- POST REQUESTS -----------------------------

  // Future<Result<AuthModel>> login({
  //   required String mobile,
  //   required String mobileCode,
  //   required String password,
  // });

  //! ----------------------------- GET REQUESTS -----------------------------
  Future<Result<SuccessModel>> get${_capitalName}Data();

  // Future<Result<SuccessModel>> checkCompanyUser(
  //     String companyCode, String username);

  // Future<Result<SuccessModel>> companyConfiguration(String companyCode);
}''',
    //!MARK: api services file
    'lib/features/$_lowerNamePath/data/api/${_lowerNamePath}_api_services.dart':
        '''
import 'package:$_appName/core/networking/models/success_model.dart';
import 'package:$_appName/core/networking/network/network_call.dart';
import 'package:$_appName/core/networking/network/result.dart';
import 'package:$_appName/features/$_lowerNamePath/data/api/${_lowerNamePath}_api_constants.dart';
import 'package:$_appName/features/$_lowerNamePath/data/repo/${_lowerNamePath}_repo.dart';

class ${_capitalName}ApiServices extends ${_capitalName}Repo {
  @override
  Future<Result<SuccessModel>> get${_capitalName}Data() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: ${_capitalName}ApiConstants.get${_capitalName}Data,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}''',
    //!MARK: api constants file
    'lib/features/$_lowerNamePath/data/api/${_lowerNamePath}_api_constants.dart':
        '''
class ${_capitalName}ApiConstants {
  static const String get${_capitalName}Data = '$_capitalName';
}''',
    //!MARK: view file
    'lib/features/$_lowerNamePath/views/${_lowerNamePath}_view.dart':
        '''
import 'package:flutter/material.dart';

import 'package:$_appName/core/widgets/app_scaffold.dart';
import 'package:$_appName/features/$_lowerNamePath/views/widgets/${_lowerNamePath}_body.dart';
import 'package:$_appName/core/widgets/main_app_bar.dart';

class ${_capitalName}View extends StatelessWidget {
  const ${_capitalName}View({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
    verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title:  "$_capitalName", // or use LocaleKeys.${_lowerName}_title.tr(context: context) if using localization
      ),
      body: const ${_capitalName}Body(),
    );
  }
}''',
    //!MARK: body widget file
    'lib/features/$_lowerNamePath/views/widgets/${_lowerNamePath}_body.dart':
        '''
import 'package:flutter/material.dart';

class ${_capitalName}Body extends StatelessWidget {
  const ${_capitalName}Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: []);
  }
}''',
  };

  // Generating Folders
  for (var dir in directories) {
    Directory(dir).createSync(recursive: true);
  }
  log('Folders created successfully ✔️');
  // Process.runSync(
  //   "flutter",
  //   ['pub', 'add', ...List<String>.from(data['dependencies'])],
  // );
  // log('Dependencies added successfully ✔️');
  // Process.runSync(
  //   "flutter",
  //   ['pub', 'add', '--dev', ...List<String>.from(data['dev_dependencies'])],
  // );
  //; Generating Files
  files.forEach((filePath, content) {
    File(filePath).createSync(recursive: true);
    File(filePath).writeAsStringSync(content);
  });
  // Show message in terminal and VS Code output
  log('✅ All folders and files created successfully!');
  print('\x1B[32m✅ All folders and files created successfully!\x1B[0m');
}
