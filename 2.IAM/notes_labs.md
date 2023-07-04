# Lab 1: Cho phép IAM user xem billing
- https://www.youtube.com/watch?v=-Y7m7lxxAg4&ab_channel=TechMasterVietnam
+ Backgroup: cho phép kế toán xem chi tiêu AWS

+ Reference: [Overview of managing access permissions](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/control-access-billing.html)

+ Process:
    - sign in by root user
    - Account -> IAM user & Role access to billing information 
    - Default: "IAM user/role access to billing information is deactivated."
        - Edit -> Activate 
        - Change to: "IAM user/role access to billing information is activated."
    - Security Credentials -> Users -> accountant account  -> Add permission -> 
        - Cách 1: tạo 1 group có Policy cho phép xem billing, add accountant
        - Cách 2: thêm trực tiếp Policy cho phép xem billing đối với accountant
    - Add "AWSBillingReadOnlyAccess"


# Lab 2: 
- https://www.youtube.com/watch?v=AzJ1Vc1v1sg&ab_channel=TechMasterVietnam

# Lab 3: 
- https://www.youtube.com/watch?v=3uGvkGchEq4&ab_channel=TechMasterVietnam