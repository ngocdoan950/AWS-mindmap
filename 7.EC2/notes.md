# EC2

## Objectives
+ Identify what is Amazon EC2
+ EC2 terminology
+ 

## Ageda
### 1. EC2 overview

+ EC2 Terminology


### 2. EC2 Design

+ AWS uses hypervisor which is includes:
    - original host architecture: Xen-based

    - AWS nitro hypervisor:

    - Bare metal:

+ AWS Nitro System
    - 

+ EC2 Security Groups
    - name
    - description
    - protocol
    - 

+ Tiered EC2 Security Groups

### 3. Labs

#### Lab 7.1. Create EC2 instance
+ Requirement:
    - Create ec2 instance
    - install nginx for this instance

+ Terminology:
    - **E**lastic **B**lock **S**torage: loại lưu trữ co giãn được, lưu trữ trên nhiểu ổ cứng vật lý kết nối qua mạng tốc độ cao, chống mất mát dữ liệu.
    - **E**lastic **N**etwork **A**dapter Enable: :
        - lower latencies (giảm độ trễ mạng)
        - lower network jiter (giam trồi sụt)
        - higher packet-per-second (truyền được nhiều gói tin trong 1 giây hơn)'

+ Connect EC2 qua SSH:
    - In order to use root permission:
    ```
    $ 
    ```

    - Network settings:
        - Firewall (security groups): cho phép dải ip nào có thể truy cập.
        - Inbound security groups rules:
            - Source type: My IP
    - Advanced details: 
        - User data: định nghĩa các command line ưu tiên chạy trước khi khởi tạo instance

#### Lab 7.2 Connect to EC2
+ 4 ways:
    - EC2 instance connect (console)
    - Session Manager
    - SSH client
    - EC2 Serial Connect

+ SSH client:
    - Create new keypair - [refer](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html):

    ```
    $ aws ec2 create-key-pair \
        --key-name ec2-keypair \
        --key-type rsa \
        --key-format pem \
        --query "KeyMaterial" \
        --region ap-southeast-1 \
        --output text > ec2-key-pair.pem
    ```

    - connect
    ```
    $ chmod 400 key_name.pem
    $ ssh -i "key_name.pem" ec2-user@
    ```
        - **note**: Default user name is "ec2-user"
        - issues:
            - ''

    - **how to change key-pair to access ec2 instance ? **
        - 
        ```
        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2sRgRRyhI4AvfCxybIzbvpP/QieGlLzdIzM+ACG0nvc/52TRSe0A+Cmb4IBWLR5M2ynnBWR5ABfOlqbs7yOzShdr+qYWC207Srww3HBoi1A5S9fwdNERlMGh/BASoZGp/gNbpgAbQZ499QZ0Bl9HJPt8yzfglqdaUGUEq20vVXBNFZsycQq9Jfng8o9oMYHbiFxTy7qa1oQmqcN439tjzW7Uyo3tfk9vsxUjGgZ5SelCmIKlkAVzYZfZwZUKo3xKnjeNHGXPxOZPv81m/uQypoyzXg+JuBf1tkUNKZW32rTVHXKDMBOh0UJL3xVykFAl5FxZHWA8Sgj4EQzS0zQZL
        ```

#### Lab 7.3: Open port for EC2 - Edit Inbound rule
+ Objective:
    - cấu hình EC2 instance phản hồi ping (ping request)