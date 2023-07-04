# Lab 5.1 Get started with AWS cli s3

+ list of buckets:
    ```
    $ aws s3 ls
    ```

+ make a bucket:
    ```
    $ aws s3 mb s3://<bucket_name> --region ap-southeast-1
    ```

+ Upload file:
    ```
    aws s3 cp <local_file_name> s3://<your_bucket>/<remote_file_name>
    ```

+ Download file:
    ```
    aws s3 cp s3://<your_bucket>/<remote_file_name> <local_file_name>
    ```

+ Upload a folder:
    ```
    aws s3 cp <your_folder> s3://<your_bucket>/<your_folder> --recursive
    ```

# Lab 5.2 S3 policy & IAM policy
+ **Note**: DENY rule - highest priority

+ Tao user voi permission: AmazonS3ReadOnlyAccess
+ Update the bucket policy:
    - Sample: 
        ```
        {
        "Id": "Policy1662172976089",
        "Version": "2012-10-17",
        "Statement": [
            {
            "Sid": "Stmt1662172968634",
            "Action": [
                "s3:PutObject"
            ],
            "Effect": "Deny",
            "Resource": "arn:aws:s3:::doannn950-bucket",
            "Principal": {
                "AWS": [
                "arn:aws:iam::683550486032:user/s3_user"
                ]
            }
            }
        ]
        }
        ```

    - User case 1: Chan user s3 truy cap vao 1 
        - S3 -> Permissions -> Edit bucket policy
            - "Principal": IAM user -> s3_user 
            ```
            {
                "Version": "2012-10-17",
                "Id": "Policy1659844597434",
                "Statement": [
                    {
                        "Sid": "Stmt1659844595662",
                        "Effect": "Deny",
                        "Principal": {
                            "AWS": "arn:aws:iam::<account_id>:user/s3_user"
                        },
                        "Action": "s3:*",
                        "Resource": "arn:aws:s3:::<your_bucket>"
                    }
                ]
            }
            ```


## Lab 5.3 Hosting web site tĩnh lên s3
+ Install s3-tree:
    ```
    $ sudo apt-get install tree
    ```

+ Block Public Access settings for this bucket => Unblock để người ngoài cũng có thể truy cập
+ Create bucket
    - Properties -> Static website hosting -> Edit -> Enable
    - Index document: định nghĩa trang mặc định ("index.html") -> Save change
+ Syns file using aws cli:
    ```
    $ aws s3 sync . s3://[folder_html]
    ```

+ Kiem tra web:
    - Static website hosting 

+ Permissions -> Edit bucket policy -> 
    ```
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "Statement1",
                "Action": ["s3:GetObject"],
                "Effect": "Allow",
                "Principal": "*",
                "Resource": [
                    "arn:aws:s3:::lab5.3-metal/*"
                ]
            }
        ]
    }
    ```

    - **Note**: nên copy nội dung bucket policy vào text editor để check space.

+ Bucket -> *Publicly accessible* -> check url


## lab 5.4: Từ EC2, upload file lên s3 dùng aws cli
+ Tao instance:
+ Tao role cho instance
    - using admin account -> create roles
+ Gan role cho instance    
    - Select instance -> Security -> Modify IAM role
    - truy ssh bang keypair:
        - cap quyen cho keypair:
            ```
            $ sudo chmod 400 *.key
            ```
        - truy cap:
            ```
            $ ssh -i *.pem [Public_IPv4_address]
            ```

## lab 5.5: replication
+ Tao buckets
    - vao source bucket:
        - Replication rules 
        - Destination ~> Destin
+ Tao IAM role
    - tao IAM role co quyen replicate object giua 2 buckets
        - IAM -> Roles -> Use cases for other AWS services: ~> S3
+ Add permission -> "AmazonS3FullAccess" policy
    ```
    {
    "Version":"2012-10-17",
    "Statement":[
        {
            "Effect":"Allow",
            "Action":[
                "s3:GetReplicationConfiguration",
                "s3:ListBucket"
            ],
            "Resource":[
                "arn:aws:s3:::lab5.5-replication-01"
            ]
        },
        {
            "Effect":"Allow",
            "Action":[
                "s3:GetObjectVersionForReplication",
                "s3:GetObjectVersionAcl",
                "s3:GetObjectVersionTagging"
            ],
            "Resource":[
                "arn:aws:s3:::lab5.5-replication-01/*"
            ]
        },
        {
            "Effect":"Allow",
            "Action":[
                "s3:ReplicateObject",
                "s3:ReplicateDelete",
                "s3:ReplicateTags"
            ],
            "Resource":"arn:aws:s3:::lab5.5-replication-02/*"
        }
    ]
    }
    ```

## lab 5.6 Sharing objecs by pre-signed urls

- Presigned URL : URL mà bạn có thể cung cấp cho người dùng của mình để cấp quyền truy cập tạm thời vào một đối tượng S3 cụ thể.

+ Use case: ta muốn sharing object url nhưng k muốn public ip
    - demo/ngăn chặn xem chùa

+ Using console:
    - vao object muon share -> Object actions -> Share with a presigned URL
+ Using cli:
    ```
    $ aws s3 presign s3://lab5.5-replication-01/test_file_upload.txt --expires-in 100
    ```    
