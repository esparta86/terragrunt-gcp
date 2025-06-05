
remote_state {
  backend = "gcs"
  config = {
    bucket = "BUCKET_NAME"
    prefix = "${path_relative_to_include()}/terraform-infra.tfstate"
    project  = "PROJECT_ID"
    location = "eu"
    # credentials = "BASE_PATH_TO_FILE_IF_YOU_WANT"
  }

}
