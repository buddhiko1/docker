### Cautions 
  - Secrets file must with no line terminators.
    ```
    file email.txt`: ASCII text, with no line terminators
    ```
### Install
  - `mv email.example.txt email.txt`
  - `mv passwd.example.txt passwd.txt`
  - `mv secrets /run/`

### Deploy
  - Set url of USER_INVITE_URL_ALLOW_LIST and PASSWORD_RESET_URL_ALLOW_LIST in the config.json.
