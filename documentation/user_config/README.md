# User config

The user config mainly contains credentials (api keys, license keys, secrets and tokens). Those are typically user, or account, specific and need to be handled with care. Those are also often re-used for multiple deployments of a same user.

The structure of the user config is a list of credentials, for example:

```json
{
  "credentials": {

    "aws": {
      "apiKey": "my_aws_api_key",
      "secretKey": "my_aws_secret_key",
      "secretKeyPath": "/path/to/my/secretkey.pem",
      "region": "my_aws_region"
    },

    "azure": {
      "client_id": "my_client_id",
      "tenant": "my_tenant_id",
      "subscription_id": "my_subscription_id",
      "secret": "my_secret",
      "region": "my_region",
      "sshPublicKeyPath": "/path/to/my/id_rsa.pub"
    },

    "newrelic": {
      "licenseKey": "my_new_relic_license_key",
      "insightsInsertApiKey": "my_new_relic_insights_api_key",
      "accountId": "my_new_relic_account_id"
    },

    "git": {
      "username": "my_git_access_token"
    }
  }
}
```
*Note*: 

## Credentials

The sections belows give more details regarding how to setup each specific credential.
Proceed with any of the section below depending on your needs. Typically the tutorial uses only AWS, Git and NewRelic.

* [Azure](credentials/azure/README.md)
* [Aws](credentials/aws/README.md)
* [Git](credentials/git/README.md)
* [NewRelic](credentials/newrelic/README.md)
