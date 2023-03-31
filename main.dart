// @formatter:off
void main() {

  DartPanel().scalablePanel(
      scale: 21,
      texts: ["Simple Panel Scalable", "My First Topic"]);

  DartPanel().simplePanel(
      texts: ["Simple Panel Scalable", "My First Topic"]);

  DartPanel().fullPanel(
        scale: 21,
        margin: 2,
        upSpace: 3,
        downSpace: 3,
        cornersFormat: _Border.BOLD,
        centerMarksFormat: _Border.DOUBLE,
        horizontalLinesFormat: _Border.DOUBLE,
        verticalLinesFormat: _Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers: ["My Panel","First Topic","Second Topic"]);
  }

class DartPanel {

  void simplePanel({
    required List<String> texts}) {
    fullPanel(
        scale: 21,
        margin: 5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: _Border.DOUBLE,
        centerMarksFormat: _Border.DOUBLE,
        horizontalLinesFormat: _Border.THIN,
        verticalLinesFormat: _Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers:texts);
  }

  void scalablePanel({
    required int scale,
    required List<String> texts}) {
    fullPanel(
        scale: scale,
        margin:5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: _Border.DOUBLE,
        centerMarksFormat: _Border.DOUBLE,
        horizontalLinesFormat: _Border.THIN,
        verticalLinesFormat: _Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers: texts);
  }

  void fullPanel({
    required int scale,
    required int margin,
    required int upSpace,
    required int downSpace,
    required _Border cornersFormat,
    required _Border centerMarksFormat,
    required _Border horizontalLinesFormat,
    required _Border verticalLinesFormat,
    required bool uppercaseTitle,
    required bool centralizeTitle,
    required List<String> titleAndOthers,}
  ) {
    var estimatedAdjustmentFactor = 3;
    var title = titleAndOthers[0];
    var marginTitle = scale - (title.length ~/ 2) - estimatedAdjustmentFactor;
    var formattedTexts =
    titleAndOthers
       .map((item) => item == title && centralizeTitle ? ' ' * marginTitle + title : item)
       .map((item) => item == title && uppercaseTitle ? item.toUpperCase() : item)
       .toList();

    var marginLimitedBySize = margin < scale ? margin : scale;

    // scale + margin discrepacies eliminated
    if (marginLimitedBySize.isOdd) --marginLimitedBySize;
    if (scale.isOdd) ++scale;

    int fullSize = (scale * 2) - marginLimitedBySize;
    if (fullSize.isEven) ++fullSize; else --fullSize;

    var whitespaceMargin = ' ' * marginLimitedBySize;
    var externalUpSpaces = '\n' * upSpace;
    var externalBottomSpaces = '\n' * downSpace;

    var upperFace = _upperLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var divider = _middleLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var bottomFace = _bottomLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var faceLine = _faceLineCreator(verticalLinesFormat);

    var titleTextArea = fullSize.toString();
    var textPreparation = StringBuffer()
      ..write(externalUpSpaces)
      ..write(upperFace)
      ..write(faceLine)
      ..write('$whitespaceMargin $titleTextArea''s')
      ..write(faceLine)
      ..write('\n')
      ..write(divider);

    // "-1" Because the first element in the Array was used as title
    // The discont-number in bodyTextArea/fullsize, subtract the size of "ordinal-ASC" and ") "
    var bodyTextArea = (fullSize - 4).toString();
    var topicEnumeration = 0;
    var ordinalSymbolEnumerator = '\u2070';
    for (int i = formattedTexts.length - 1; i > 0; i--) {
      ++topicEnumeration;
      textPreparation
        ..write(faceLine)
        ..write('$whitespaceMargin$topicEnumeration$ordinalSymbolEnumerator) '
            '$bodyTextArea s')
        ..write(faceLine)
        ..write('\n');
    }
    textPreparation
      ..write(bottomFace)
      ..write(externalBottomSpaces);
    print([textPreparation.toString(), formattedTexts]);
  }

  String _faceLineCreator(_Border corner) {
    switch (corner) {
      case _Border.BOLD:
        return _BoldFont.FACE_LINE.code;
      case _Border.THIN:
        return _ThinFont.FACE_LINE.code;
      case _Border.DOUBLE:
        return _DoubleFont.FACE_LINE.code;
      default:
        return '';
    }
  }

  String _generateLine(
      String baseChar,
      int scale,
      String BASE_LINE) {
    return (baseChar * scale).replaceAll(baseChar, BASE_LINE);
  }

  String _upperLine(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border line) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_BoldFont.UPPER_RIGHT_CORNER.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_ThinFont.UPPER_RIGHT_CORNER.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(_DoubleFont.UPPER_RIGHT_CORNER.code);
        break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    switch (line) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    String baseline = _generateLine('_', scale, borderStylingItems[2]);

    return borderStylingItems[0] + baseline + borderStylingItems[1] + "\n";
  }

  String _middleLine(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border baseLine) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_BoldFont.MIDDLE_RIGHT.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_ThinFont.MIDDLE_RIGHT.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.MIDDLE_LEFT.code);
        borderStylingItems.add(_DoubleFont.MIDDLE_RIGHT.code);
        break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    switch (baseLine) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    var divider = _generateLine('_', scale, borderStylingItems[3]);

    return borderStylingItems[0] +
        divider +
        borderStylingItems[2] +
        divider +
        borderStylingItems[1] +
        "\n";
  }

  String _bottomLine(
      int scale,
      _Border corner,
      _Border centerMark,
      _Border baseLine,
      ) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.FACE_LINE.code);
        borderStylingItems.add(_BoldFont.FACE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.FACE_LINE.code);
        borderStylingItems.add(_ThinFont.FACE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.FACE_LINE.code);
        borderStylingItems.add(_DoubleFont.FACE_LINE.code);
        break;
    }

    switch (centerMark) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    switch (baseLine) {
      case _Border.BOLD:
        borderStylingItems.add(_BoldFont.BASE_LINE.code);
        break;
      case _Border.THIN:
        borderStylingItems.add(_ThinFont.BASE_LINE.code);
        break;
      case _Border.DOUBLE:
        borderStylingItems.add(_DoubleFont.BASE_LINE.code);
        break;
    }

    var baseline = _generateLine('_', scale, borderStylingItems[3].toString());

    return borderStylingItems[0] +
        baseline +
        borderStylingItems[2] +
        baseline +
        borderStylingItems[1] +
        "\n";
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