## 1.1. Create multiple profiles
+ Default region name [None]: ap-southeast-1
+ Default output format [None]: table

ec2_user
AKIAZ6JWIVYIO74JIL76 
olBAIR0gLu6LTov/n5NNetF9DOvWwpS+W5n+O0kq

s3_user
AKIAZ6JWIVYIGYBPQXER
9qQKrSIMqBbwQJQOE7aXbM+as6g7vfmHMMMPDejkw 

Admin
AKIAZ6JWIVYIAPY5OIB3
2GnSc/srD/lQs+wysIQw6W/zg90efl6LoXSJk2gv

user1 
AKIAZ6JWIVYIIU3AIQ5Z
pIEPhP2B6UKWJfE9wTZqTB+3Zbg6WRpkNK3rXWCA


## 1.2. Using CLI
+ [AWS Command Line Interface](https://aws.amazon.com/vi/cli/)
    - path: /usr/local/bin/aws --version

+ Muốn thêm access-key cho users exist trong *credentials*:
    - config *credentials*:
        $ vim credentials
    - add user's access-key & secrete access-key:  
        ```
        [user_name]
        aws_access_key_id = 
        aws_secret_access_key = 
        ```

+ Update *config* file:
    ```
    [profile user_name]
    region = ap-southeast-1
    output = text/table/json
    ```

+ Liệt kê danh sách các instance EC2 dùng profile của ec2_user:
    ```
    $ aws ec2 describe-instances --profile ec2_user
    ```

+ Liệt kê các bucket dùng profile default:
    ```
    $ aws s3 ls --profile default
    ```


## 1.3 Cảnh báo chi phí

! Bật instance thì nhớ tắt

+ Billing Dashboard -> Budget

## 1.4 Tối ưu chi phí sử dụng AWS

+ Chi phí AWS phụ thuộc bởi các yếu tố:
    - loại dịch vụ
    - cấu hình dịch vụ (CPU, RAM, Storage ...)
    - thời gian
    - cường độ (khối lượng tính toán, số lượng truy cập)
    - vị trí
    - Cùng chức năng căn bản nhưng tính sẵn sàng cao hơn, độ trễ thấp hơn, truy xuất đọc ghi lưu trữ (I/O band width) cao hơn ... sẽ đắt hơn

+ Nhiều dịch vụ AWS thiết kế sẵn cho kiến trúc microservice/multitenant:
    ![microservice/multitenant](./figures/microservice/multitenant)

+ AWS cung cấp các công cụ về chi phí:
    - dự toán chi phí (calculator.aws)
        - Create Estimate
        - Lựa chọn loại dịch vụ (vd: EC2)
        - Thiết lập cấu hình/thông tin cho dịch vụ
            - *Utilization*: thiết lập dành cho nhu cầu sử dụng không đều đặn (chi phí sẽ lớn hơn so với dùng cả tháng). Thông tin điền vào sẽ là % sử dụng dịch vụ trong 1 thời gian. Vd: 100%/tháng ~> bạn luôn bật dịch vụ trong tháng. 30%/ngày ~> bạn có nhu cầu sử dụng 7.2 giờ/ngày
    - báo cáo chi phí (/cost-management/home)
    - cảnh báo chi phí vượt ngưỡng

+ Vi dụ estimate cho 1 service có db:
    - loại dịch vụ: **R**elational **D**atabase **S**ervice (Example: Amazon RDS for MySQL) -> configure
    - db.m1.small/large
    - Tính toán bộ nhớ ()
        - **Bandith** = network_performance x utilization_value x num_day x numb_hour x numb_minutes x numb_second (Terabyte)

+ Tính toán bộ nhớ cho blog (API gateway):        
    - daily: 3000 sessions
    - 1 session 50 http requests
    => 4.5 mil requests

