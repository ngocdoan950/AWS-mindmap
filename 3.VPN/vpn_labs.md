# VPC lab 01: Tao VPC don gian voi Public Subnet

## Requirements
- [] Dung 1 VPC 
- [] Tao 2 public sub net
- [] Cau hinh internet gateway
- [] Tao EC2 instance ket noi qua internet => verify successful

## Step by step
[x] Truy cap Your VPC -> Tao VPC
[x] Tao Subnet cho vpc vua tao
    - Lưu ý: tạo địa chỉ IP cho subnet phai nam trong dai dia chi cua VPC
    - Bat tinh nang tu dong gan ip subnet cho cac tai nguyen (EC2 instance ...) ben trong
        - Edit subnet setting -> Enable "Auto-assign IP settings" 
[x] Tao internet gateway
    - Gan vpc cho I.G nay
        - "Attact to VPC"
    - Tao route table:  
        - Sau khi tao dc -> Subnet associations 
    - Khai bao default gate way cho subnet
        - Edit routes -> Add route -> 0.0.0.0/0  & I.G cua vpc vua tao
[] Kiem tra lai thong qua may ao EC2:
    - launch instance
    - network setting: 
        - chon dung vpc
    - instance running
    
