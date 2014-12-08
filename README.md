vagrant-openstack-juno
======================

Script huong dan cai dat openstack juno bang vgrant

Cách sử dụng
- Tải vagrant mới (từ 1.7 trở lên)
- Tải virtualbox phiên bản mới (từ 4.3)
- Git clone đường dẫn từ vietstack sau đó làm các bước sau:

1. Chạy câu lênh "$vagrant up" để tạo máy ảo.

2. Sau khi các máy ảo được boot, sẽ có 2 máy ảo bao gồm master (controller+compute) và slave (compute)

3. Đối với máy ảo master:

   3.1 Chạy câu lệnh "$vagrant ssh master".
   3.2 Git clone devstack từ tang chủ của devstack.
   3.3 Vào folder "/home/vagrant/devstack" tạo file local.conf
   3.4 Chạy lệnh  "$git checkout stable/icehouse" nếu muốn cài đặt Icehouse hoặc stable/juno nếu muốn dùng Juno.
   3.5 Copy nội dung file master_local vào file local.conf
   3.6 Chạy "$./stack.sh" 

4. Đối với máy ảo slave:
   4.1 Chạy câu lênh "$vagrant ssh slave"

Note: Các bước còn lại làm tương tự như máy ảo master, thay vì copy nội dung file master_local, ta copy nội dung 
file slave_local vào file local.conf
