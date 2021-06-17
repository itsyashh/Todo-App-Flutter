class Task {
  String _date;
  String _taskName;
  String _details;

  Task(String _date, String _taskName, String _details) {
    this._date = _date;
    this._taskName = _taskName;
    this._details = _details;
  }

  //Setter

  set date(String date) {
    this._date = date;
  }

  set taskName(String taskName) {
    this._taskName = taskName;
  }

  set details(String details) {
    this._details = details;
  }

  //getter

  String get date => this._date;
  String get taskName => this._taskName;
  String get details => this._details;
}
