import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:mason/mason.dart';

import '../utils/utils.dart';

part 'mvvm_view_create.dart';

class CreateCommand extends Command<int> {
  @override
  String get description => "Create Project, Features and MVVM template";

  @override
  String get name => "create";

  CreateCommand() {
    addSubcommand(CreateMVVMCommand());
  }
}
