// ignore_for_file: constant_identifier_names

enum Status { LOADING, SUCCESS, ERROR }

class ResourceState<T> {
  Status status;
  T? data;
  Exception? error;

  ResourceState.loading() : status = Status.LOADING;
  ResourceState.success(this.data) : status = Status.SUCCESS;
  ResourceState.error(this.error) : status = Status.ERROR;
}
