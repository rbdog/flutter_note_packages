import '../../state/data.dart';

abstract class PrefsInterface {
  Future<MobilePreviewData?> load();

  Future<void> save(MobilePreviewData data);
}
