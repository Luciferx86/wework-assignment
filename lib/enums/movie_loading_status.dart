enum MoviesLoadingStatus {
  initial,
  success,
  error,
  loading,
}

extension MoviesLoadingStatusX on MoviesLoadingStatus {
  bool get isInitial => this == MoviesLoadingStatus.initial;
  bool get isSuccess => this == MoviesLoadingStatus.success;
  bool get isError => this == MoviesLoadingStatus.error;
  bool get isLoading => this == MoviesLoadingStatus.loading;
}
