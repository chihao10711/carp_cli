part of 'create_command.dart';

class CreateMVVMCommand extends Command<int> {
  CreateMVVMCommand({
    Logger? logger,
  }) : _logger = logger ?? Logger();

  final Logger _logger;

  @override
  String get description => "Create ViewState and ViewModel by template";

  @override
  String get name => "mvvm";

  ArgResults? get _argResults => argResults;

  @override
  Future<int> run() async {
    await runCommand();
    return ExitCode.success.code;
  }

  Future<void> runCommand() async {
    final generatingMvvm = _logger.progress('Generating MVVM template....');
    final brick = Brick.git(
      const GitPath(
        'https://github.com/chihao10711/flutter_cli.git',
        path: 'projects_template/bricks/mvvm_template',
      ),
    );
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(Directory.current);
    await generator.generate(target,
        vars: <String, dynamic>{'name': _argResults?.arguments.first});
    generatingMvvm.complete("Generating MVVM template successfully");
  }
}
