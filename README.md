# tls-server-sample
サーバーに自分で用意した証明書を設定し、HTTPS通信できる環境を構築する

## 公開鍵・秘密鍵生成
```bash
# 秘密鍵作成
$ openssl genrsa -out private.key 4096

# 公開鍵作成
$ openssl rsa -in private.key -out public.key -outform PEM -pubout
```

## 参考
参考リンクなど

### OpenSSLコマンド
- `openssl req`: https://www.openssl.org/docs/manmaster/man1/openssl-req.html
- `openssl genrsa`: https://www.openssl.org/docs/manmaster/man1/openssl-genrsa.html
- `openssl rsa`: https://www.openssl.org/docs/manmaster/man1/openssl-rsa.html
