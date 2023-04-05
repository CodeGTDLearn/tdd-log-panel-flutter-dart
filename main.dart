// @formatter:off
void main() {

  DartPanel().scalablePanel(
      scale: 21,
      texts: ["Simple Panel Scalable", "My First Topic"]);

  DartPanel().simplePanel(
      texts: ["Simple Panel", "My First Topic"]);

  DartPanel().panel(
        scale: 21,
        margin: 2,
        upSpace: 3,
        downSpace: 3,
        cornersFormat: _Border.BOLD,
        centerMarksFormat: _Border.DOUBLE,
        horizontalFacesFormat: _Border.DOUBLE,
        lateralFacesFormat: _Border.THIN,
        isUppercaseTitle: true,
        isCentralizedTitle: true,
        titleAndOthers: ["My Panel","First Topic","Second Topic","Third Topic"]);
  }

class DartPanel {

  void simplePanel({
    required List<String> texts}) {
    panel(
        scale: 21,
        margin: 5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: _Border.DOUBLE,
        centerMarksFormat: _Border.DOUBLE,
        horizontalFacesFormat: _Border.THIN,
        lateralFacesFormat: _Border.THIN,
        isUppercaseTitle: true,
        isCentralizedTitle: true,
        titleAndOthers:texts);
  }

  void scalablePanel({
    required int scale,
    required List<String> texts}) {
    panel(
        scale: scale,
        margin:5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: _Border.DOUBLE,
        centerMarksFormat: _Border.DOUBLE,
        horizontalFacesFormat: _Border.THIN,
        lateralFacesFormat: _Border.THIN,
        isUppercaseTitle: true,
        isCentralizedTitle: true,
        titleAndOthers: texts);
  }

  void panel({
    required int scale,
    required int margin,
    required int upSpace,
    required int downSpace,
    required _Border cornersFormat,
    required _Border centerMarksFormat,
    required _Border horizontalFacesFormat,
    required _Border lateralFacesFormat,
    required bool isUppercaseTitle,
    required bool isCentralizedTitle,
    required List<String> titleAndOthers,}
  ) {
    var estimatedAdjustmentFactor = 3;
    var title = titleAndOthers[0];
    var marginTitle = scale - (title.length / 2).round() - estimatedAdjustmentFactor;
    var titleAndTopics =
    titleAndOthers
     .map((item) => item == title && isCentralizedTitle ? (' ' * marginTitle) + title : item)
     .map((item) => item == title && isUppercaseTitle ? item.toUpperCase() : item)
     .toList();

    var marginLimitedBySize = margin < scale ? margin : scale;

    /*╔════════════════════════════════════════╗
      ║ scale + margin discrepacies eliminated ║
      ╚════════════════════════════════════════╝*/
    if (marginLimitedBySize.isOdd) --marginLimitedBySize;
    if (scale.isOdd) ++scale;

    int fullSize = (scale * 2) - marginLimitedBySize;
    if (fullSize.isEven) ++fullSize; else --fullSize;

    var topicMargin = (' ' * marginLimitedBySize);
    var externalUpSpaces = '\n' * upSpace;
    var externalBottomSpaces = '\n' * downSpace;

    var upperFace = _createUpperFace(
      scale, cornersFormat, centerMarksFormat, horizontalFacesFormat);

    var dividerFace = _createDividerFace(
      scale, cornersFormat, centerMarksFormat, horizontalFacesFormat);

    var bottomFace = _createBottomFace(
      scale, cornersFormat, centerMarksFormat, horizontalFacesFormat);

    var leftLateralFace = _createLateralFace(lateralFacesFormat);
    var rightLateralFace = _createLateralFace(lateralFacesFormat);

    var titleTextArea = ' ' * (fullSize - titleAndTopics[0].length - 2);
    var textPreparation = StringBuffer()
      ..write(externalUpSpaces)
      ..write(upperFace)
      ..write(rightLateralFace)
      ..write('$topicMargin ${titleAndTopics[0]} $titleTextArea')
      ..write(leftLateralFace)
      ..write('\n')
      ..write(dividerFace);

    /*╔═══════════════════════════════════════════════════════════════╗
      ║ "-1" Because the first element in the Array was used as title ║
      ║ The discont-number in fillUpSpaces/fullsize, subtract the size║
      ║ of "ordinal-ASC" and ") "                                     ║
      ╚═══════════════════════════════════════════════════════════════╝*/
    var topicEnumerator = 0;
    var symbolEnumerator = '\u2070';
    for (int i = titleAndTopics.length - 1; i > 0; i--) {
      ++topicEnumerator;
      var fillUpSpaces = ' ' * (fullSize - titleAndTopics[topicEnumerator].length - 4);
      textPreparation
        ..write(leftLateralFace)
        ..write(
            '$topicMargin'
            '$topicEnumerator'
            '$symbolEnumerator) '
            '${titleAndTopics[topicEnumerator]}'
            '$fillUpSpaces')
        ..write(leftLateralFace)
        ..write('\n');
    }

    textPreparation
      ..write(bottomFace)
      ..write(externalBottomSpaces);

    print('$textPreparation');
  }

  String _createLateralFace(_Border corner) {
    switch (corner) {
      case _Border.BOLD:   return _BoldFont.FACE_LINE.code;
      case _Border.THIN:   return _ThinFont.FACE_LINE.code;
      case _Border.DOUBLE: return _DoubleFont.FACE_LINE.code;
      default:             return '';
    }
  }



  String _createUpperFace(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border line) {
    List<String> borderStylingItems = [];

    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_BoldFont.UPPER_RIGHT_CORNER.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_ThinFont.UPPER_RIGHT_CORNER.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_DoubleFont.UPPER_RIGHT_CORNER.code); break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    switch (line) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    String upperFace = _faceGenerator('_', ((scale * 2)+1), borderStylingItems[2]);

    return borderStylingItems[0] + upperFace + borderStylingItems[1] + "\n";
  }

  String _createDividerFace(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border baseLine) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_BoldFont.MIDDLE_RIGHT.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_ThinFont.MIDDLE_RIGHT.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_DoubleFont.MIDDLE_RIGHT.code); break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    switch (baseLine) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    var panelDivider = _faceGenerator('_', scale, borderStylingItems[3]);

    return
        borderStylingItems[0] +
        panelDivider +
        borderStylingItems[2] +
        panelDivider +
        borderStylingItems[1] +
        "\n";
  }

  String _createBottomFace(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border baseLine,
      ) {
    List<String> borderStylingItems = [];

    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.LOWER_LEFT_CORNER.code);
        borderStylingItems.add(_BoldFont.LOWER_RIGHT_CORNER.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.LOWER_LEFT_CORNER.code);
        borderStylingItems.add(_ThinFont.LOWER_RIGHT_CORNER.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.LOWER_LEFT_CORNER.code);
        borderStylingItems.add(_DoubleFont.LOWER_RIGHT_CORNER.code); break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    switch (baseLine) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code); break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code); break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code); break;
    }

    var bottonFace = _faceGenerator('_', scale, borderStylingItems[3]);

    return
        borderStylingItems[0] +
        bottonFace +
        borderStylingItems[2] +
        bottonFace +
        borderStylingItems[1] +
        "\n";
  }

  String _faceGenerator(
      String baseChar,
      int scale,
      String BASE_LINE) {
    return (baseChar * scale).replaceAll(baseChar, BASE_LINE);
  }
}

enum _BoldFont {
  FACE_LINE('\u2503'),
  BASE_LINE('\u2501'),
  UPPER_LEFT_CORNER('\u250F'),
  UPPER_RIGHT_CORNER('\u2513'),
  MIDDLE_LEFT('\u2523'),
  MIDDLE_RIGHT('\u252B'),
  LOWER_LEFT_CORNER('\u2517'),
  LOWER_RIGHT_CORNER('\u251B');

  final String code;

  const _BoldFont(this.code);
}

enum _ThinFont {
  FACE_LINE('\u2502'),
  BASE_LINE('\u2500'),
  UPPER_LEFT_CORNER('\u250C'),
  UPPER_RIGHT_CORNER('\u2510'),
  MIDDLE_LEFT('\u252C'),
  MIDDLE_RIGHT('\u2524'),
  LOWER_LEFT_CORNER('\u2514'),
  LOWER_RIGHT_CORNER('\u2518');

  final String code;

  const _ThinFont(this.code);
}

enum _DoubleFont {
  FACE_LINE('\u2551'),
  BASE_LINE('\u2550'),
  UPPER_LEFT_CORNER('\u2554'),
  UPPER_RIGHT_CORNER('\u2557'),
  MIDDLE_LEFT('\u2560'),
  MIDDLE_RIGHT('\u2563'),
  LOWER_LEFT_CORNER('\u255A'),
  LOWER_RIGHT_CORNER('\u255D');

  final String code;

  const _DoubleFont(this.code);
}

enum _Border { BOLD, THIN, DOUBLE }
// @formatter:on