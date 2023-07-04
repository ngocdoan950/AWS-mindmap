# S3

## S3 Basic
+ Global storage service

+ **Objects** stored in **bucket**
    - lưu trữ dạng object 
    - objects: audio, video, images, logs ...
+ Bucket: 
    - created in one region
+ Access method:
    - console UI/CLI/SDK

### S3 bucket  
+ Bucket's name only one ~ **globally unique**
    - leng: 3-63, number, 
    - Khong gioi han su lương object, object: 0 bytes -> 5TB
    - khong phai file system
        - dung de luu tru doi tuong,
        - k the dung de cai OS
    - default private:

### Object & Bucket

+ Simple lab: create a bucket

+ Object's features:
    - key: file
    - value: file's data (binary)
    - metadata

+ các file dc tai len co cau truc phang (cac file dong cap)
    - toc do truy cap cac file/objects (ben ngoài hay bên trong) la nhu nhau
    - du la 2 file giong nhau nhung cac key la khac nhau

+ Lab 01: 
    - List all bucket:
        ```
        $ aws s3 ls
        ```
    - make bucket
        ```
        $ aws s3 mb s3://s5-s3-object-bucket-lab01
        ```
    - ...

## S3 bucket versioning  

### Versioning type
+ object duoc xac dinh boi key. Neu dc versioning:
    - 

+ **Nếu sử dụng versioning thì chi phí sẽ tăng lên**
    - Bật cấp độ bucket ~ bật cho toàn bộ các files trong bucket
        - default: disable
        - khi chuyen tu enable -> disable, cac file moi se k dc versioning con cac file cu sẽ k đổi
        - co the delete "delete marked"
    - Nên sử dụng cho các tính năng bảo mật
    => lifecycle 
| Disable  |  Enable |
|---|---|
| An object be defined by object's name (key)  |   |
|   |   |

## Bucket Policy
+ As same as IAM policy
    - ALLOW/DENY rules: áp dụng cho same/different account.
    - If ALLOW & DENY rule impact 1 resource => *DENY rule applied*.
    - Applied for anonymous principal (user not in AWS)

+ Muốn hiệu chỉnh class:

