part of carp_cli;

class CarpCliCommandRunner extends CommandRunner<int> {
  CarpCliCommandRunner({Logger? logger})
      : _logger = logger ?? Logger(),
        super('carp_cli', 'Flutter MVVM Command Line Interface') {
    argParser.addFlag(
      'version',
      abbr: 'v',
      negatable: false,
      help: 'Print the current version.',
    );
    addCommand(CreateCommand());
    // addCommand(SubmitCommand());
    // addCommand(CreateCommand());
    // addCommand(FeaturesCommand());
  }

  final Logger _logger;
  late ArgResults _argResults;

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      _argResults = parse(args);
      return await runCommand(_argResults) ?? ExitCode.success.code;
    } on FormatException catch (e) {
      _logger
        ..info('')
        ..err(e.message)
        ..info('')
        ..info(usage);
      exit(0);
    } on UsageException catch (e) {
      _logger
        ..info('')
        ..err(e.message)
        ..info('')
        ..info(e.usage);
      exit(0);
    }
  }

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults['version'] == true) {
      _logger.info('package version: 1.0.0');
      return ExitCode.success.code;
    }
    return super.runCommand(topLevelResults);
  }
}
