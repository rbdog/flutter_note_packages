abstract class UiAnswer {
  String? get value;
  bool get isOk;
  bool get isCancel;
  bool get isValue;
}

class UiOkAnswer implements UiAnswer {
  @override
  bool get isOk => true;

  @override
  bool get isCancel => false;

  @override
  bool get isValue => false;

  @override
  String? get value => null;
}

class UiCancelAnswer implements UiAnswer {
  @override
  bool get isOk => false;

  @override
  bool get isCancel => true;

  @override
  bool get isValue => false;

  @override
  String? get value => null;
}

class UiValueAnswer implements UiAnswer {
  const UiValueAnswer(String this.value);

  @override
  bool get isOk => false;

  @override
  bool get isCancel => false;

  @override
  bool get isValue => true;

  @override
  final String? value;
}
