final List<String> listExpressions = ['x', '/', '+', '-', '='];
final RegExp multiRegExp =
    new RegExp(r'((?:\-)?(\d+(?:\.\d+)?))(x)((?:\-)?(\d+(?:\.\d+)?))');
final RegExp divRegExp =
    new RegExp(r'((?:\-)?(\d+(?:\.\d+)?))(\/)((?:\-)?(\d+(?:\.\d+)?))');
final RegExp sumRegExp =
    new RegExp(r'((?:\-)?(\d+(?:\.\d+)?))(\+)((?:\-)?(\d+(?:\.\d+)?))');
final RegExp subRegExp =
    new RegExp(r'((?:\-)?(\d+(?:\.\d+)?))(\-)((?:\-)?(\d+(?:\.\d+)?))');
