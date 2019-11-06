# Windows Signer Action

This action will sign a binary using an RSA 2048 x509 certification. It expects a crt and key file to be stored in an environment variable along with name, domain, and binary path.

## Required Environment Variables

- `WINDOWS_CERT` - Your public certificate (this should be a GitHub secret)
- `WINDOWS_KEY` - Your signing key (this should be a GitHub secret)
- `BINARY` - Path to the binary you want signed
- `NAME` - Name of signer
- `DOMAIN` - Domain of signer

If you want to test with a self signed certs you can generate some with:
```bash
openssl req \
    -newkey rsa:2048 -nodes -keyout codesign.key \
    -x509 -days 365 -out bundle.crt
# and put them in a local environment var with
export WINDOWS_CERT=$(bundle.crt)
export WINDOWS_KEY=$(codesign.key)
```

## Example

```
- name: Sign Windows Binary
      uses: jonfriesen/windows-signer-action@v1.0.0
      env:
        NAME: SignerName
        DOMAIN: https://SignerDomain.com
        BINARY: dist/MyBinary.exe
        WINDOWS_CERT: ${{ secrets.WINDOWS_CERT }}
        WINDOWS_KEY: ${{ secrets.WINDOWS_KEY }}
```