class BaseState {
  const BaseState();
}

class InitResult extends BaseState {
  const InitResult();
}

class LoadingResult extends BaseState {
  const LoadingResult();
}

class ErrorResult extends BaseState {
  final String error;

  const ErrorResult(this.error);
}

class SuccessResult<T> extends BaseState {
  final T? data;

  const SuccessResult({this.data});
}

class OtpSentSuccessfully extends BaseState {}

class OtpVerificationSuccess extends BaseState {
  const OtpVerificationSuccess();
}

class ForgetPasswordOtpSuccess extends BaseState {
  const ForgetPasswordOtpSuccess();
}

class ForgetPasswordChangeSuccess extends BaseState {
  const ForgetPasswordChangeSuccess();
}
