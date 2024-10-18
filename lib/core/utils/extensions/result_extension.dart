// ignore: implementation_imports, depend_on_referenced_packages
import 'package:async/src/result/result.dart';

extension FoldResult<T> on Result<T> {
  R fold<R>(R Function(T data) onSuccess, R Function(Object error) onError) {
    if (asValue?.value != null) {
      return onSuccess(asValue!.value);
    } else {
      return onError(asError?.error ?? "Problem occurred");
    }
  }
}
