# Buổi 1 - Điện toán đám mây 
+ Cloud computing
    - viec su dung IT resouces, applications thong qua internet & chi tra phi voi nhung gi su dung
    - nguon dien toan khong lo: app, service/ internet thay vi tren local

+ 3 dang dien toan dam may
    - infrastructure as a service
        - os -> app nguoi thue quan ly
        - ben duoi hardware nha cung cap quan ly
        - network: hyperviser
    - platform as a service
        - data, app nguoi thue quan ly
        - den duoi data: 
            - midleware (chuong trinh de tao moi truong, java, trinh bien dich ... tao ra moi truong chay chuong trinh), 
            - os
    - software as a service
        - su dung user do ben quan ly cung cap
        - su dung service, k quan ly gi

+ Ưu điểm cloud:
    - không phải đầu tự vào IT resources tại thời điểm ban đầu mà vẫn vận hành được hệ thống.
    - chi phí biến động, tùy theo nhu cầu sử dụng -> tránh lãng phí
    - k mất thời gian dự toán chi phí ban đầu
    - tốc độ scale nhanh chóng, phù hợp với các mô hình kinh doanh mới như start up
    - khả năng linh hoạt cao
    - tập trung phát triển sản phẩm
    - trở lên global nhanh chóng, tăng tốc độ ứng dụng theo các vùng

+ Tại sao là AWS ?
    - ra đời sớm (2006)
    - nhiều zone 
    
+ Associate
    - SAA-Co2
    - DVA-Co1

+ Vai trò AWS Solution Architect:
    - thiết kế các dịch vụ AWS kết hợp với nhau đúng mục tiêu nghiệp vụ, chi phí thấp, dễ mở rộng
    - Dự toán chi phí ngắn hạn, trung hạn ...
    - Rà soat những nguy cơ bảo mật khi triển khai AWS,  
    - ...

+ Nên 
    - thực hành nhiều & va vấp nhiều tình huống 
    ...

### Khái niệm
+ Bare metal/dedicated server:
    - dành cho 1 khách hàng 
        - dữ liệu bảo mật, k thể chia sẻ
        - high performance / liên tục 
+ Cloud server
    - dùng chung cho nhiều khách hàng
    - ảo hóa ~> dùng chung
+ Private cloud
    - chỉ dành cho 1 công ty
+ Public cloud
    - bán dịch vụ
+ Monolithic
    - phần mềm đóng gói tất cả chứng năng vào 1 khối.    
+ Microservice:
    - chi nhỏ các services độc lập & phân tán trên các máy chủ khác nhau
    - các services giao tiếp thông quan giao tiếp mạng
    - dành cho các hệ thống lớn + phức tạp ....   
    

+ Vertical scaling:
    - nâng cấp server bằng con lớn hơn
+ Horizontal scaling:
    - nâng cấp bằng nhiều con bằng nhau
+ Availability:
    - up-time 
+ Network latency:  
    - độ trễ giao tiếp trên mạng
    - total = send_time + receive_time
+ Fixed price & pay         
    - trả trước
+ On demand - dùng bao nhiêu trả bấy nhiêu (theo tháng) & ngưng bất kì khi nào
+ Upfont payment - trả trước
+ Partial payment -     


+ EC2: 
    - máy ảo trên cloud (VPS)

+ EBS:
    - loại lưu trữ gắn vào EC2 (~ SSD/ HDD)

+ RDS:
    - dịch vụ về database  services     
+ Lambda: 
    - dịch vụ tính toán (cung cấp cpu, ram, ...) dùng chạy chương trình (~  EC2)
    - dùng cho các chương trình rất nhỏ
+ Cloudfont:
    - content delivery network: cho phép đặt vị trí theo nhu cầu (gần khách hàng)    
+ DynamoDB:
    

### Điểm chung của các AWS Service
+ Quy trình khởi tạo: 
+ Tham số khởi tạo 
+ Cách tính giá
    - on demand:
    - saving plans:
    - spot instances
    - reservation:
+ Cơ chế cấp quyền thao tác 
+ Được gán tên duy nhất ARB
+ Thao tác từ web console ...
+ 