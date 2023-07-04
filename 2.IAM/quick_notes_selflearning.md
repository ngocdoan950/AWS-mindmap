# IAM 101

## 1. Overview

+ AWS **I**dentity and **A**ccess **M**anagement
    - Quản lý các truy cập vào tài nguyên của AWS
    - Mục đich:
        - authenticated (signed in) ~ xác thực
        - authorized (has permission) ~ ủy quyền

+ AWS roor account & IAM account
    - Account owner (~ root account)
        - rất hạn chế sử dụng
    - IAM user
        - tạo 1 admin user cho phép cấp quyền.

+ Account ID & account alias
    - Account id: only one (12 chars)
    - Account alias: 
        - thay thế cho account id (khó nhớ)
        - only one

+ **M**ulti **F**actor **A**uthentication (~ xác thực đa yếu tố)
    - one time pass
    - improve security
    - Using MFA devices

## IAM user, Group, Role & Policy    

### IAM user 
+ Definition: là thực thể đại diện cho 1 người/ứng dụng có khả năng thao tác trên AWS.

+ Định danh IAM user
    - tên trên giao diện web console
    - Amazon Resource Name
    - Unique Identifier của user

### IAM group 
+ Khái niệm:
    - sử dụng nhằm quản trị 1 nhóm các IAM user
    - có thể phân quyền cho user thông qua group
    - nhiều user <-> nhiều group
    - quyền hạn user là tổng hợp nhiều group

### Thao tác vói AWS
+ Các phương thức thao tác:
    - console
    - api
        - AWS - CLI, SDK, CDK

### IAM policy overview
+ Khái niệm:
    - định nghĩa các quyền hạn cho 
    - không phân biệt phương thức thực hiện
    - *Note*: nếu k cấp quyền thì user không đc cấp bất kì quyền nào.

+ Phương pháp gắn policy cho user
    - 
    - smart: tạo policy -> gán cho user (cần truy cập user)
    - best: tạo policy -> gán cho group -> gán user cho group

+ Policy management
    - AWS managed policy
    - Customer managed policy    
        - các policy độc lập & ngang quyền với nhau

+ Cấu trúc cơ bản của 1 policy
    - wildcard : cho phep 1 loạt action List - >list.*

+ Effect: deny được ưu tiên hơn effect: allow
    - 1 deny: 

### Identity-based & Resources-based

+ Identity-based policies:
    - gắn cho IAM user, group hoặc role
    - xác định User, Group, role có quyền thao tác với tài nguyên nào


## 2. IAM User, Group, Role & Policy


## 3. Summary


## 4. Labs

