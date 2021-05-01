class PagesWidgetModel {
  static PagesWidgetModel _instance;

  PagesWidgetModel._internal() {
    _instance = this;
  }

  factory PagesWidgetModel() => _instance ?? PagesWidgetModel._internal();
  //homePage
  final homePageAppBar = "Tool Bag";
  final changeTheme = "Change Theme";
  final searchOnGoogle = "Search on Google";
  final hesCode = "HES Code";
  final toDoList = "To-Do List";
  final gallery = "Gallery";
  final sms = "SMS";
  final changeUI = "Change UI";
  final alertSearch = "Please enter what you want to search";
  final close = "Close";

  //hesCodePage
  final name = "Name";
  final validityDate = "Select Validity Date";
  final save = "Save";
  final hesCodeList = "Hes Code List";
  final empty = "Empty";

  //searchPage
  final googleSearchLink = "https://www.google.com/search?q=";

  //To-Do Page
  final emptyList = "Empty List";
  final description = "Please write the description";
}
