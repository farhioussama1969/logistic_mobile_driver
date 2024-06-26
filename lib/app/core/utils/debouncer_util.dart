import 'dart:async';
import 'dart:ui';

class DebouncerUtil {
  static Duration? delay = const Duration(milliseconds: 900);
  static Timer? _timer;
  static VoidCallback? _callback;

  DebouncerUtil();

  static void debounce(VoidCallback callback, {Duration? delayTime}) {
    _callback = callback;
    cancel();
    _timer = Timer(delayTime ?? delay!, flush);
  }

  static void cancel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  static void flush() {
    _callback!();
    cancel();
  }
}
