# GitHub Action to Download Assets from Azure Blob Storage

This action is designed to use the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to upload a directory of your choice to your Azure Blob Storage account.

## Usage

### Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: Download from Azure Blob Storage
on:
  push:
    branches:
      - main
jobs:
  upload:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: bacongobbler/azure-blob-storage-download@main
        with:
          dest_dir: tmp
          container_name: www
          connection_string: ${{ secrets.ConnectionString }}
          #extra_args: '--pattern *.tar.gz'
          # WARNING: this will overwrite existing blobs in your blob storage
          overwrite: 'true'
```

If you want to synchronize local and remote state (for example, if you are publishing a static website), enable the `sync` flag.

### Required Variables

| Key                 | Value                                                                      |
|---------------------|----------------------------------------------------------------------------|
| `container_name`    | The name of the storage account container these assets will be uploaded to |
| `source_dir`        | The name of the directory you want to upload                               |

### Optional Variables

| Key                 | Value                                                                                                                                   |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| `account_name`      | The name of the storage account. Required if `sas_token` is used                                                                        |
| `connection_string` | The connection string for the storage account. Used if value is set. Either `connection_string` or `sas_token` must be supplied         |
| `extra_args`        | Extra arguments that can be passed to `az storage blob upload-batch`. Useful for passing flags like `--pattern` or `--destination-path` |
| `overwrite`         | Overwrite existing files in the destination container. Defaults to false                                                                |
| `sas_token`         | The shared access signature token for the storage account. Either connection\_string or sas\_token must be supplied                     |
| `sync`              | Use `az storage blob sync` to synchronize blobs recursively. Defaults to false (`az storage blob upload-batch`)                         |

## License

This project is distributed under the [Apache 2 license](LICENSE).
