# Mục tiêu
Triển khain web site PHP vào tên miền hocphp.fun

Các đầu việc bạn cần chỉnh sửa:

1. Đăng ký một tên miền trên namecheap rồi trỏ sang Route53 Host Zone
2. Tạo Elastic IP để gắn vào EC2 khai báo ở file var.tf
3. sửa lại tên miền trong trường `server_name    hocphp.fun www.hocphp.fun;` file phpsite.conf



# Tham khảo
- [How to Setup PHP-FPM (PHP 8) Nginx in Amazon Linux 2](https://awswithatiq.com/setup-php-nginx-in-amazon-linux-2/)
- [Nginx Server Block to create a virtual host](https://awswithatiq.com/nginx-server-block-to-create-a-virtual-host/)
- [How to Set Up SSL for Nginx using Letsencrypt in AWS 2021](https://awswithatiq.com/how-to-set-up-ssl-for-nginx-using-letsencrypt-in-aws/)