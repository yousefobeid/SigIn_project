class WelcomeEvent {}

// class PageChangedEvent extends WelcomeEvent {
//   final int pageIndex;
//   PageChangedEvent(this.pageIndex);
// }
class PageChangedEvent extends WelcomeEvent {
  final int page;
  PageChangedEvent(this.page);
}
