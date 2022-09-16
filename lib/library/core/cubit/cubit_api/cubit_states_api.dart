abstract class CSApi {
  const CSApi();
}

class CSStart extends CSApi {
  const CSStart();
}

class CSLoading extends CSApi {
  const CSLoading();
}

class CSError extends CSApi {
  const CSError();
}

class CSCompleted extends CSApi {
  final dynamic data;

  const CSCompleted(this.data);
}
