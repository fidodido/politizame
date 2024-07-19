enum ExportStatus { initial, loading, error, loaded }

class ExportState {
  final ExportStatus status;

  ExportState({
    this.status = ExportStatus.initial,
  });

  ExportState copyWith({
    ExportStatus? status,
  }) =>
      ExportState(
        status: status ?? this.status,
      );
}
