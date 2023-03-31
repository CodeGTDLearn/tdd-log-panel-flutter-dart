// @formatter:off
void main() {

  DartPanel().scalablePanel( 21, ["Simple Panel Scalable", "My First Topic"]);

  DartPanel().simplePanel(["Simple Panel Scalable", "My First Topic"]);

  DartPanel().panel(
        scale: 21,
        margin: 2,
        upSpace: 3,
        downSpace: 3,
        cornersFormat: Border.BOLD,
        centerMarksFormat: Border.DOUBLE,
        horizontalLinesFormat: Border.DOUBLE,
        verticalLinesFormat: Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers: ["My Panel","First Topic","Second Topic"]);
  }

class DartPanel {

  void simplePanel(List<String> texts) {
    panel(
        scale: 21,
        margin: 5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: Border.DOUBLE,
        centerMarksFormat: Border.DOUBLE,
        horizontalLinesFormat: Border.THIN,
        verticalLinesFormat: Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers:texts);
  }

  void scalablePanel(int scale, List<String> texts) {
    panel(
        scale: scale,
        margin:5,
        upSpace: 1,
        downSpace: 1,
        cornersFormat: Border.DOUBLE,
        centerMarksFormat: Border.DOUBLE,
        horizontalLinesFormat: Border.THIN,
        verticalLinesFormat: Border.THIN,
        uppercaseTitle: true,
        centralizeTitle: true,
        titleAndOthers: texts);
  }

  String faceLineCreator(Border corner) {
    switch (corner) {
      case Border.BOLD:
        return BoldFont.FACE_LINE.code;
      case Border.THIN:
        return ThinFont.FACE_LINE.code;
      case Border.DOUBLE:
        return DoubleFont.FACE_LINE.code;
      default:
        return '';
    }
  }

  String generateLine(
      String baseChar,
      int scale,
      String BASE_LINE) {
    return (baseChar * scale).replaceAll(baseChar, BASE_LINE);
  }

  String upperLine(
      int scale,
      Border corner,
      Border centerMark,
      Border line) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(BoldFont.UPPER_RIGHT_CORNER.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(ThinFont.UPPER_RIGHT_CORNER.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.UPPER_LEFT_CORNER.code);
        borderStylingItems.add(DoubleFont.UPPER_RIGHT_CORNER.code);
        break;
    }

    switch (centerMark) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    switch (line) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    String baseline = generateLine('_', scale, borderStylingItems[2]);

    return borderStylingItems[0] + baseline + borderStylingItems[1] + "\n";
  }

  String middleLine(
      int scale,
      Border corner,
      Border centerMark,
      Border baseLine) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.MIDDLE_LEFT.code);
        borderStylingItems.add(BoldFont.MIDDLE_RIGHT.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.MIDDLE_LEFT.code);
        borderStylingItems.add(ThinFont.MIDDLE_RIGHT.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.MIDDLE_LEFT.code);
        borderStylingItems.add(DoubleFont.MIDDLE_RIGHT.code);
        break;
    }

    switch (centerMark) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    switch (baseLine) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    var divider = generateLine('_', scale, borderStylingItems[3]);

    return borderStylingItems[0] +
        divider +
        borderStylingItems[2] +
        divider +
        borderStylingItems[1] +
        "\n";
  }

  String bottomLine(
    int scale,
    Border corner,
    Border centerMark,
    Border baseLine,
  ) {
    List<String> borderStylingItems = [];
    switch (corner) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.FACE_LINE.code);
        borderStylingItems.add(BoldFont.FACE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.FACE_LINE.code);
        borderStylingItems.add(ThinFont.FACE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.FACE_LINE.code);
        borderStylingItems.add(DoubleFont.FACE_LINE.code);
        break;
    }

    switch (centerMark) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    switch (baseLine) {
      case Border.BOLD:
        borderStylingItems.add(BoldFont.BASE_LINE.code);
        break;
      case Border.THIN:
        borderStylingItems.add(ThinFont.BASE_LINE.code);
        break;
      case Border.DOUBLE:
        borderStylingItems.add(DoubleFont.BASE_LINE.code);
        break;
    }

    var baseline = generateLine('_', scale, borderStylingItems[3].toString());

    return borderStylingItems[0] +
        baseline +
        borderStylingItems[2] +
        baseline +
        borderStylingItems[1] +
        "\n";
  }

  void panel({
    required int scale,
    required int margin,
    required int upSpace,
    required int downSpace,
    required Border cornersFormat,
    required Border centerMarksFormat,
    required Border horizontalLinesFormat,
    required Border verticalLinesFormat,
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

    var upperFace = upperLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var divider = middleLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var bottomFace = bottomLine(scale, cornersFormat, centerMarksFormat, horizontalLinesFormat);
    var faceLine = faceLineCreator(verticalLinesFormat);

    var titleTextArea = fullSize.toString();
    var textPreparation = StringBuffer()
      ..write(externalUpSpaces)
      ..write(upperFace)
      ..write(faceLine)
      ..write('$whitespaceMargin$titleTextArea''s')
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
}

enum BoldFont {
  FACE_LINE('\u2503'),
  BASE_LINE('\u2501'),
  UPPER_LEFT_CORNER('\u250F'),
  UPPER_RIGHT_CORNER('\u2513'),
  MIDDLE_LEFT('\u2523'),
  MIDDLE_RIGHT('\u252B'),
  LOWER_LEFT_CORNER('\u2517'),
  LOWER_RIGHT_CORNER('\u251B');

  final String code;

  const BoldFont(this.code);
}

enum ThinFont {
  FACE_LINE('\u2502'),
  BASE_LINE('\u2500'),
  UPPER_LEFT_CORNER('\u250C'),
  UPPER_RIGHT_CORNER('\u2510'),
  MIDDLE_LEFT('\u252C'),
  MIDDLE_RIGHT('\u2524'),
  LOWER_LEFT_CORNER('\u2514'),
  LOWER_RIGHT_CORNER('\u2518');

  final String code;

  const ThinFont(this.code);
}

enum DoubleFont {
  FACE_LINE('\u2551'),
  BASE_LINE('\u2550'),
  UPPER_LEFT_CORNER('\u2554'),
  UPPER_RIGHT_CORNER('\u2557'),
  MIDDLE_LEFT('\u2560'),
  MIDDLE_RIGHT('\u2563'),
  LOWER_LEFT_CORNER('\u255A'),
  LOWER_RIGHT_CORNER('\u255D');

  final String code;

  const DoubleFont(this.code);
}

enum Border { BOLD, THIN, DOUBLE }
// @formatter:on