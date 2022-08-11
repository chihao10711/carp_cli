import 'package:carp_cli/carp_cli.dart';

Future<void> main(List<String> args) async {
  await CarpCliCommandRunner().run(args);
}
